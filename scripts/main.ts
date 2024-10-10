import {
  world,
  Player,
  system,
  EquipmentSlot,
  ContainerSlot,
  EntityEquippableComponent,
} from "@minecraft/server"
import { ModalFormData } from "@minecraft/server-ui"

world.beforeEvents.itemUse.subscribe((e) => {
  const { source, itemStack } = e
  if (source.isSneaking) {
    // we can't access dynamice content from an itemStack,
    // so we grab the item in the mainhand slot (our goggles)
    let equippable = source.getComponent(
      "equippable"
    ) as EntityEquippableComponent
    const item = equippable?.getEquipmentSlot(EquipmentSlot.Mainhand)
    if (
      item.getItem() != undefined &&
      item.typeId.startsWith("the_ore_finder_project:") &&
      item.typeId.endsWith("_goggles")
    ) {
      e.cancel = true

      let name = String(item.typeId)
      name = name.replace("the_ore_finder_project:", "")
      name = name.replace("_goggles", "")
      system.run(() => {
        showGoggleOptions(source, item, name + " Goggles - Options")
      })
    }
  }
})

function showGoggleOptions(player: Player, item: ContainerSlot, title: string) {
  // pull the options of the item
  let options = { dd: false }
  if (item.getDynamicProperty("options") != undefined) {
    options = JSON.parse(item.getDynamicProperty("options") as string)
  }

  // build the modal
  const modalForm = new ModalFormData().title(title)
  modalForm.toggle("Double Distance", options.dd)
  modalForm
    .show(player)
    .then((formData) => {
      if (formData.formValues) {
        let saveOptions = {
          dd: formData.formValues[0],
        }
        item.setDynamicProperty("options", JSON.stringify(saveOptions))
        if (saveOptions.dd == true) {
          item.setLore(["§gDouble Distance: §aEnabled"])
        } else {
          item.setLore(["§gDouble Distance: §8Disabled"])
        }
      }
    })
    .catch((error: Error) => {
      player.sendMessage("Failed to show form: " + error)
      return -1
    })
}

system.runInterval(() => {
  for (let player of world.getPlayers()) {
    let ops = getEquipmentOptions(player)
    // pull the options of the item
    if (JSON.stringify(ops) !== "{}") {
      Object.entries(ops).forEach(([name, options]: [string, any]) => {
        if (options.dd != undefined && options.dd == true) {
          player.runCommand("function blocks/find_" + name + "_double_distance")
        } else {
          player.runCommand("function blocks/find_" + name)
        }
      })
    }

    player.runCommand(
      "execute as @e[tag=torp_entity] at @s unless entity @s[tag=visible] run kill @s"
    )
    player.runCommand(
      "execute as @e[tag=visible] at @s run tag @s remove visible"
    )
  }
}, 5)

function getEquipmentOptions(p: Player) {
  let ops = {}
  let equippable = p.getComponent("equippable") as EntityEquippableComponent
  let slots = [
    equippable?.getEquipmentSlot(EquipmentSlot.Mainhand),
    equippable?.getEquipmentSlot(EquipmentSlot.Head),
    equippable?.getEquipmentSlot(EquipmentSlot.Offhand),
  ]

  slots.forEach((item) => {
    if (
      item.getItem() != undefined &&
      item.typeId.startsWith("the_ore_finder_project:") &&
      item.typeId.endsWith("_goggles")
    ) {
      //Object.assign(ops, { show: true })
      let name = String(item.typeId)
      name = name.replace("the_ore_finder_project:", "")
      name = name.replace("_goggles", "")

      // WE NEED TO ADD TESTING FOR OVERWORLD AND UNIVERSAL GOGGLES,
      if (item.getDynamicProperty("options") != undefined) {
        Object.assign(ops, {
          [name]: Object(
            JSON.parse(item.getDynamicProperty("options") as string)
          ),
        })
      } else {
        Object.assign(ops, { [name]: {} })
      }
    }
  })

  return ops
}

/*function getOptions(item: ContainerSlot, ops: Object) {
  if (
    item.getItem() != undefined &&
    item.typeId.startsWith("the_ore_finder_project:") &&
    item.typeId.endsWith("_goggles")
  ) {
    //Object.assign(ops, { show: true })
    if (item.getDynamicProperty("options") != undefined) {
      let name = item.typeId
      name = name.replace("the_ore_finder_project:", "")
      name = name.replace("_goggles", "")
      Object.assign(ops, { [name]: item.getDynamicProperty("options") })
    }
  }
  return ops
}*/

world.beforeEvents.worldInitialize.subscribe((initEvent) => {
  initEvent.blockComponentRegistry.registerCustomComponent(
    "the_ore_finder_project:ore_finder_component",
    {
      onPlace(arg) {
        // get the location of the current block
        let pos = arg.block.location

        // prepare to pull name from the placeholder block name
        let previous_ore = arg.block.type.id
        let the_name = arg.block.type.id

        // pull out the ore name, just the ore name
        the_name = the_name.replace("minecraft:", "")
        the_name = the_name.replace("the_ore_finder_project:", "")
        the_name = the_name.replace("_placeholder", "")
        the_name = the_name.replace("deepslate_", "")
        the_name = the_name.replace("nether_", "")
        the_name = the_name.replace("lit_", "")
        the_name = the_name.replace("raw_", "")
        the_name = the_name.replace("block", "ore")

        // Switch the ore back
        //previous_ore = previous_ore.replace("_placeholder", "")
        //previous_ore = previous_ore.replace("the_ore_finder_project:", "")
        //arg.dimension.setBlockType(pos, previous_ore)

        // Summon the indicator entity
        let entlist = arg.dimension.getEntitiesAtBlockLocation(pos)
        if (
          entlist.find(
            (e) =>
              e.typeId === "the_ore_finder_project:vanilla_indicator_entity"
          ) == undefined
        ) {
          pos.x += 0.5
          //pos.y += 0.5 // only uncomment this to make the placholder poke out the top of the ore, used for testing material settings
          pos.z += 0.5
          const ore = arg.dimension.spawnEntity(
            "the_ore_finder_project:vanilla_indicator_entity",
            pos
          )
          ore.triggerEvent("the_ore_finder_project:" + the_name)
          ore.addTag("torp_entity")
          ore.addTag("visible")
          ore.addTag(the_name)
        }
      },
    }
  )
})

// watch for blocks to break, then remove the indicator entity if it exists
world.afterEvents.playerBreakBlock.subscribe((e) => {
  for (let p of world.getPlayers()) {
    let ents = p.dimension.getEntitiesAtBlockLocation(e.block)
    for (let ent of ents) {
      if (ent.typeId == "the_ore_finder_project:vanilla_indicator_entity") {
        ent.remove()
      }
    }
  }
})
