import {
  world,
  Player,
  system,
  EquipmentSlot,
  ContainerSlot,
  EntityEquippableComponent,
  Vector3,
  BlockVolume,
} from "@minecraft/server"
import { ModalFormData } from "@minecraft/server-ui"

// minimum distance from player to indicator entities before they get removed
const MIN_DISTANCE = 0

/**
 * this runInterval is set to run 4 times a second
 *
 */
system.runInterval(() => {
  const players = world.getPlayers()

  // if no players, return (this only happens as the world is loading)
  if (players.length == 0) return

  players.forEach((player) => {
    player.runCommand(
      'execute as @a at @s run fill ~6 ~6 ~6 ~-6 ~-2 ~-6 air replace light_block ["block_light_level"=9]',
    )
    player.runCommand(
      "execute as @e[tag=night_vision] at @s run tag @s remove night_vision",
    )

    let ops = getAllEquipmentOptions(player)
    // pull the options of the item
    if (JSON.stringify(ops) !== "{}") {
      Object.entries(ops).forEach(([name, options]: [string, any]) => {
        find_blocks(player, options.findblocks, options.dd)

        if (
          options.slot == EquipmentSlot.Head &&
          (options.effect == undefined || options.effect != 0)
        ) {
          if (options.effect == 1) {
            player.runCommand(
              'execute as @a at @s run fill ~ ~ ~ ~ ~1 ~ light_block ["block_light_level"=9] keep',
            )
          }
          if (options.effect == 2) {
            player.addTag("night_vision")
            player.runCommand(
              "execute as @a[tag=night_vision] run effect @s night_vision 30 0 true",
            )
          }
        }
      })
    }

    killEntitiesNearPlayer(player)
  })

  // if an entity doesn't have the visible tag, kill it
  players[0].runCommand(
    `execute as @e[tag=torp_entity] at @s unless entity @s[tag=visible] run kill @s`,
  )
  // remove the visible tag
  players[0].runCommand(
    `execute as @e[tag=torp_entity, tag=visible] at @s run tag @s remove visible`,
  )
}, 4)

function getAllEquipmentOptions(p: Player) {
  let ops = {}
  let slots = [
    EquipmentSlot.Mainhand,
    EquipmentSlot.Offhand,
    EquipmentSlot.Head,
  ]

  slots.forEach((slot) => {
    let slot_ops = getEquipmentOptions(p, slot)

    Object.assign(ops, slot_ops)
  })

  return ops
}

/**
 * function getEquipmentOptions
 *
 * @param p : Minecraft Player object
 * @returns an object based on the name of the item from the Mainhand, Head, and Offhand slots
 */
function getEquipmentOptions(p: Player, slot: EquipmentSlot) {
  let ops = {}
  let equippable = p.getComponent("equippable") as EntityEquippableComponent
  let item = equippable?.getEquipmentSlot(slot)

  // tags can be multiple types, so we break it down to a json string
  let prevTagsRaw = p.getDynamicProperty(slot + "_tags") as string | undefined
  let prevTags: string[] | undefined = undefined
  if (prevTagsRaw !== undefined) {
    try {
      prevTags = JSON.parse(prevTagsRaw)
    } catch {
      prevTags = undefined
    }
  }

  let itemChanged = false
  let block_name = undefined
  if (detectItemChanged(p, slot)) {
    kill_all_indicators(p)

    // item changed, so we need to clear the old item's color and indicator based on prevTags
    if (prevTags != undefined) {
      prevTags.forEach((tag: string) => {
        if (tag.startsWith("findblock:")) {
          // as we're parsing through, set player dynamic properties for the colors
          let na = tag.replace("findblock:", "").split(":")
          let color = na.shift()
          block_name = tag.replace("findblock:", "").replace(color + ":", "")
          p.setDynamicProperty(block_name + "_color", undefined)
          p.setDynamicProperty(block_name + "_indicator", undefined)
          //console.log([p.getDynamicProperty(block_name + "_indicator")]);
        }
      })
    }

    itemChanged = true
    // now update prevTags to current item
    p.setDynamicProperty(slot + "_tags", JSON.stringify(item.getTags()))
  }

  if (
    item.getItem() != undefined &&
    item.getTags().includes("the_ore_finder_project:goggles")
  ) {
    let name = String(item.typeId)
    let find_blocks: string[] = []
    let options_string = "{}"
    let options = {
      dd: false,
      effect: 1,
      indicator: 0,
      ores: {
        coal: true,
        copper: true,
        gold: true,
        iron: true,
        diamond: true,
        emerald: true,
        budding_amethyst: true,
        lapis: true,
        redstone: true,
        quartz: true,
        ancient_debris: true,
      },
    }

    if (item.getDynamicProperty("options") != undefined) {
      options_string = item.getDynamicProperty("options") as string
      options = JSON.parse(options_string)
    }

    // we need to validate options, or it could break things
    if (
      typeof options.indicator !== "number" ||
      options.indicator < 0 ||
      options.indicator > 3
    ) {
      options.indicator = 0
    }
    if (typeof options.dd !== "boolean") {
      if (options.dd == 1) options.dd = true
      else options.dd = false
    }
    if (
      typeof options.effect !== "number" ||
      options.effect < 0 ||
      options.effect > 2
    ) {
      options.effect = 1
    }

    // parse through the goggle tags looking for findblock: tags
    item.getTags().forEach((tag: string) => {
      if (tag.startsWith("findblock:")) {
        // as we're parsing through, set player dynamic properties for the colors
        let na = tag.replace("findblock:", "").split(":")
        let color = na.shift()
        let block_name = tag.replace("findblock:", "").replace(color + ":", "")

        // add entity switch to block_name player dynamic property
        p.setDynamicProperty(block_name + "_color", color)

        // set the indicator type
        switch (options.indicator) {
          case 1: {
            p.setDynamicProperty(block_name + "_indicator", "orb")
            break
          }
          case 2: {
            p.setDynamicProperty(block_name + "_indicator", "outline")
            break
          }
          case 3: {
            p.setDynamicProperty(block_name + "_indicator", "ore")
            break
          }
          default: {
            p.setDynamicProperty(block_name + "_indicator", "box")
            break
          }
        }

        // we only add to find_blocks if the ore is set to be found
        if (
          name == "the_ore_finder_project:overworld_goggles" ||
          name == "the_ore_finder_project:universal_goggles"
        ) {
          for (const [key, value] of Object.entries(options.ores)) {
            if (block_name.includes(key) && value === true) {
              //if (key == the_name && value === true) {
              find_blocks.push(block_name)
            }
          }
        } else {
          find_blocks.push(block_name)
        }
      }
    })

    ops = {
      [name]: {
        ...{ slot: slot },
        ...{ item: item },
        ...{ findblocks: find_blocks },
        ...Object(options),
      },
    }
  }

  if (itemChanged) {
    //console.log([p.getDynamicProperty(block_name + "_indicator")]);
  }

  return ops
}

// we need to kill all entities owned by a player when they leave
world.afterEvents.playerLeave.subscribe((event) => {
  const p = world.getAllPlayers()[0]
  const entities = p.dimension.getEntities({
    location: p.location,
    minDistance: 30,
  })
  for (const entity of entities) {
    if (entity.hasTag("torp_entity")) {
      entity.kill
    }
  }
})

/**
 * function find_blocks is the core of the addon, it does a fill replace around the player based on the options passed to it
 *
 * @param player
 * @param block_names
 * @param double_distance
 */
function find_blocks(
  player: Player,
  block_names: [string],
  double_distance = false,
) {
  if (block_names !== undefined) {
    // cycle through the block names that need to be replaced
    block_names.forEach((full_name: string) => {
      let d = 15
      if (double_distance) {
        d = 30
      }
      let bv = new BlockVolume(
        {
          x: player.location.x - d,
          y: player.location.y - d,
          z: player.location.z - d,
        },
        {
          x: player.location.x + d,
          y: player.location.y + d,
          z: player.location.z + d,
        },
      )
      let list = player.dimension.getBlocks(
        bv,
        { includeTypes: [full_name] },
        true,
      )
      let locations = list.getBlockLocationIterator()
      let loc = locations.next()
      while (!loc.done) {
        buildIndicatorEntity(loc.value)
        loc = locations.next()
      }
      let tag_range = `x=~-${d}, dx=${d * 2}, y=~-${d}, dy=${d * 2}, z=~-${d}, dz=${d * 2}`
      player.runCommand(
        `execute as @s run tag @e[tag=torp_entity, tag=${full_name}, ${tag_range}] add visible`,
      )
    })
  }
}

/**
 * watch beforeEvents.itemUse for usages of our goggles identified by the the_ore_finder_project:goggles tag while sneaking
 *
 */
world.beforeEvents.itemUse.subscribe((e) => {
  const { source, itemStack } = e
  if (source.isSneaking) {
    // we can't access dynamic content from an itemStack,
    // so we grab the item in the mainhand slot
    let equippable = source.getComponent(
      "equippable",
    ) as EntityEquippableComponent
    const item = equippable?.getEquipmentSlot(EquipmentSlot.Mainhand)

    if (
      item.getItem() != undefined &&
      item.getTags().includes("the_ore_finder_project:goggles")
    ) {
      // we need to cancel the equip action for goggles
      e.cancel = true

      // show the googles screen
      // we MUST do this from a system.run so the passed variables aren't read only
      system.run(() => {
        showGoggleOptions(source, item)
      })
    }
  }
})

/**
 * showGoogleOptions function
 *
 * @param player
 * @param item
 *
 * build and show the options modal for the @param item
 */
function showGoggleOptions(player: Player, item: ContainerSlot) {
  // prepare the defaults
  let options = {
    dd: false,
    effect: 1,
    indicator: 0,
    ores: {
      coal: true,
      copper: true,
      gold: true,
      iron: true,
      diamond: true,
      emerald: true,
      budding_amethyst: true,
      lapis: true,
      redstone: true,
      quartz: true,
      ancient_debris: true,
    },
  }
  let effects = ["None", "Dynamic Torch"]
  let indicators = ["Box", "Orb", "Outline", "Ore"]

  // if the item has the allow_nightvision tag, add it to available effects and set it as the default
  if (item.getTags().includes("allow_nightvision")) {
    options.effect = 2
    effects.push("Night Vision")
  }

  // pull the options of the item
  if (item.getDynamicProperty("options") != undefined) {
    options = {
      ...options,
      ...JSON.parse(item.getDynamicProperty("options") as string),
    }
  }

  // we need to validate options, or it could break things
  if (
    typeof options.indicator !== "number" ||
    options.indicator < 0 ||
    options.indicator > 3
  ) {
    options.indicator = 0
  }
  if (typeof options.dd !== "boolean") {
    if (options.dd == 1) options.dd = true
    else options.dd = false
  }
  if (
    typeof options.effect !== "number" ||
    options.effect < 0 ||
    options.effect > 2
  ) {
    options.effect = 1
  }

  // build the modal
  const modalForm = new ModalFormData()

  modalForm.title({
    translate: item.typeId + "_options",
  })

  if (player.graphicsMode != "Deferred") {
    modalForm.label(
      "                §4Glow disabled\n§6To enable glow, §fSave & Quit§6. Then\nset §fSettings§6 > §fVideo§6 >§f Graphics Mode§6 to §fVibrant Visuals§6",
    )
    modalForm.divider()
  }
  modalForm.dropdown("\nEffect (When worn on head)", effects, {
    defaultValueIndex: options.effect,
  })
  modalForm.dropdown("Indicator Type", indicators, {
    defaultValueIndex: options.indicator,
  })

  modalForm.toggle("Double Distance", { defaultValue: options.dd })

  if (
    item.typeId == "the_ore_finder_project:overworld_goggles" ||
    item.typeId == "the_ore_finder_project:universal_goggles"
  ) {
    modalForm.divider()
    modalForm.label("Find Ores§6")
    modalForm.toggle("§8Coal Ore§6", { defaultValue: options.ores.coal })
    modalForm.toggle("§nCopper Ore§6", { defaultValue: options.ores.copper })
    modalForm.toggle("§pGold Ore§6", { defaultValue: options.ores.gold })
    modalForm.toggle("§iIron Ore§6", { defaultValue: options.ores.iron })
    modalForm.toggle("§sDiamond Ore§6", { defaultValue: options.ores.diamond })
    modalForm.toggle("§qEmerald Ore§6", { defaultValue: options.ores.emerald })
    modalForm.toggle("§uBudding Amethyst§6", {
      defaultValue: options.ores.budding_amethyst,
    })
    modalForm.toggle("§tLapis Lazuli§6", { defaultValue: options.ores.lapis })
    modalForm.toggle("§mRedstone§6", { defaultValue: options.ores.redstone })
  }
  if (item.typeId == "the_ore_finder_project:universal_goggles") {
    modalForm.toggle("§hQuartz§6", { defaultValue: options.ores.quartz })
    modalForm.toggle("§jAncient Debris§6", {
      defaultValue: options.ores.ancient_debris,
    })
  }

  // because form labels and dividers are counted as formValues, we need to compensate for them
  let start = 0
  if (player.graphicsMode != "Deferred") {
    start = 2
  }

  modalForm.divider()
  modalForm.submitButton("Save Options")

  modalForm
    .show(player)
    .then((formData) => {
      if (formData.formValues) {
        let saveOptions = {
          dd: formData.formValues[start + 2],
          effect: formData.formValues[start],
          indicator: formData.formValues[start + 1],
          ores: {},
        }
        // NOTE, right now dividers and lables count as value so we skip 2 fields
        if (
          item.typeId == "the_ore_finder_project:overworld_goggles" ||
          item.typeId == "the_ore_finder_project:universal_goggles"
        ) {
          saveOptions = {
            ...saveOptions,
            ores: {
              coal: formData.formValues[start + 5],
              copper: formData.formValues[start + 6],
              gold: formData.formValues[start + 7],
              iron: formData.formValues[start + 8],
              diamond: formData.formValues[start + 9],
              emerald: formData.formValues[start + 10],
              budding_amethyst: formData.formValues[start + 11],
              lapis: formData.formValues[start + 12],
              redstone: formData.formValues[start + 13],
            },
          }
        }
        if (item.typeId == "the_ore_finder_project:universal_goggles") {
          saveOptions = {
            ...saveOptions,
            ores: {
              ...saveOptions.ores,
              quartz: formData.formValues[start + 14],
              ancient_debris: formData.formValues[start + 15],
            },
          }
        }

        item.setDynamicProperty("options", JSON.stringify(saveOptions))
        build_lore(item)
      }
      // kill all torp_entities forcing them to reload
      kill_all_indicators(player)
    })
    .catch((error: Error) => {
      player.sendMessage("Failed to show form: " + error)
      return -1
    })
}

/**
 * the build_lore function is used to generate the lore of an item based on it's options
 *
 * @param item
 */
function build_lore(item: ContainerSlot) {
  let options_string = item.getDynamicProperty("options") as string
  let ops = JSON.parse(options_string)

  let lore = []
  if (ops.dd == true) {
    lore.push("§gDouble Distance: §aEnabled")
  } else {
    lore.push("§gDouble Distance: §8Disabled")
  }
  if (ops.effect == 1) {
    lore.push("§gEffect: §aTorch")
  } else if (ops.effect == 2) {
    lore.push("§gEffect: §aNight Vision")
  } else {
    lore.push("§gEffect: §8Disabled")
  }
  if (ops.indicator == 1) {
    lore.push("§gIndicator: §aOrb")
  } else if (ops.effect == 2) {
    lore.push("§gIndicator: §aOutline")
  } else if (ops.effect == 3) {
    lore.push("§gIndicator: §aOre")
  } else {
    lore.push("§gIndicator: §aBox")
  }
  item.setLore(lore)
}

function buildIndicatorEntity(pos: Vector3) {
  let p = getClosestPlayer(pos)
  let the_block = p.dimension.getBlock(pos)
  if (the_block == undefined) {
    return
  }
  let the_name = the_block.type.id
  let the_color = p.getDynamicProperty(the_name + "_color")
  let the_indicator = p.getDynamicProperty(the_name + "_indicator")
  let entTypeId =
    "the_ore_finder_project:" + the_indicator + "_indicator_entity"
  let entlist = p.dimension.getEntitiesAtBlockLocation(pos)
  if (entlist.find((e) => e.hasTag("torp_entity")) == undefined) {
    pos.x += 0.5
    pos.y += 0.5
    pos.z += 0.5
    // don't spawn if player is too close
    const dist = distanceFromPlayer(p, pos)

    if (dist > MIN_DISTANCE) {
      // spawn the entity
      let ore = p.dimension.spawnEntity(entTypeId, pos)
      // trigger event to set the color/texture
      if (the_indicator == "ore") {
        try {
          ore.triggerEvent("the_ore_finder_project:" + the_block.type.id)
        } catch {
          // if ore event doesn't exist, rebuild the entity with box indicator
          ore = p.dimension.spawnEntity(
            "the_ore_finder_project:box_indicator_entity",
            pos,
          )
          ore.triggerEvent("the_ore_finder_project:" + the_color)
        }
      } else {
        ore.triggerEvent("the_ore_finder_project:" + the_color)
      }

      ore.addTag("torp_entity")
      //ore.addTag(`p${p.id}`)
      ore.addTag("visible")
      ore.addTag(the_block.type.id)
    }
  }
}

function getClosestPlayer(loc: Vector3) {
  let dis = 0
  let player = undefined
  world.getPlayers().forEach((p) => {
    // get the player's distance
    const dx = p.location.x - loc.x
    const dy = p.location.y - loc.y
    const dz = p.location.z - loc.z
    let d = Math.sqrt(dx * dx + dy * dy + dz * dz)
    if (d > dis) {
      dis = d
      player = p
    }
  })

  if (player == undefined) {
    return world.getPlayers()[0]
  } else {
    return player
  }
}

// watch for blocks to break, then remove the indicator entity if it exists
world.afterEvents.playerBreakBlock.subscribe((e) => {
  e.player.dimension.getEntitiesAtBlockLocation(e.block).forEach((ent) => {
    if (ent.getTags().includes("torp_entity")) {
      ent.remove()
    }
  })
})

function detectItemChanged(p: Player, slot: EquipmentSlot) {
  let equippable = p.getComponent("equippable") as EntityEquippableComponent
  let item = equippable?.getEquipmentSlot(slot)
  if (item.getItem() == undefined) {
    p.setDynamicProperty(slot, undefined)
  } else if (p.getDynamicProperty(slot) != item.typeId) {
    p.setDynamicProperty(slot, item.typeId)
    return true
  }
  return false
}

function kill_all_indicators(p: Player) {
  p.runCommand(`execute as @e[tag=torp_entity] at @s run kill @s`)
}

function killEntitiesNearPlayer(player: Player) {
  const entities = player.dimension.getEntities({ tags: ["torp_entity"] })
  entities.forEach((ent) => {
    const dist = distanceFromPlayer(player, ent.location)
    if (dist <= MIN_DISTANCE) {
      ent.kill()
    }
  })
}

function distanceFromPlayer(p: Player, loc: Vector3) {
  const dx = loc.x - p.location.x
  const dy = loc.y - p.location.y - 1.62
  const dz = loc.z - p.location.z
  const dist = Math.ceil(Math.sqrt(dx * dx + dy * dy + dz * dz))

  return dist
}

function calculateDistance(pos1: Vector3, pos2: Vector3): number {
  const dx = pos1.x - pos2.x
  const dy = pos1.y - pos2.y
  const dz = pos1.z - pos2.z
  return Math.sqrt(dx * dx + dy * dy + dz * dz)
}

// most likely going away

function showPlayerDynamicProperties(player: Player) {
  const names = player.getDynamicPropertyIds()

  if (names.length === 0) {
    world.sendMessage("You have no dynamic properties set.")
    return
  }
  names.forEach((name) => {
    const value = player.getDynamicProperty(name)
    player.sendMessage(`${name}: ${JSON.stringify(value)}`)
  })
}
