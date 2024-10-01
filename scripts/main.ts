import { world, system, Vector3 } from "@minecraft/server"

world.beforeEvents.worldInitialize.subscribe((initEvent) => {
  initEvent.blockComponentRegistry.registerCustomComponent(
    "the_ore_finder_project:ore_finder_component",
    {
      onPlace(arg) {
        // get the location of the current block
        let pos = arg.block.location
        let entity_variant = arg.block.type.id
        let previous_ore = arg.block.type.id
        let just_the_name = arg.block.type.id

        // pull out the ore name, just the ore name
        just_the_name = just_the_name.replace("the_ore_finder_project:", "")
        just_the_name = just_the_name.replace("_placeholder", "")
        just_the_name = just_the_name.replace("deepslate_", "")
        just_the_name = just_the_name.replace("nether_", "")
        just_the_name = just_the_name.replace("lit_", "")
        just_the_name = just_the_name.replace("raw_", "")
        just_the_name = just_the_name.replace("block", "ore")

        // Switch the ore back
        previous_ore = previous_ore.replace("_placeholder", "")
        previous_ore = previous_ore.replace("the_ore_finder_project:", "")
        arg.dimension.setBlockType(pos, previous_ore)

        // I would love to find a way to summon an entity without using the runCommand, but this will work for now
        let entlist = arg.dimension.getEntitiesAtBlockLocation(pos)
        if (
          entlist.find(
            (e) =>
              e.typeId === "the_ore_finder_project:vanilla_indicator_entity"
          ) == undefined
        ) {
          pos.x += 0.5
          //pos.y += 0.5 // only uncomment this to make the placholder poke out the top of the ore, used for testing material
          pos.z += 0.5
          const ore = arg.dimension.spawnEntity(
            "the_ore_finder_project:vanilla_indicator_entity",
            pos
          )
          ore.triggerEvent("the_ore_finder_project:" + just_the_name)
          ore.addTag("torp_entity")
          ore.addTag("visible")
          ore.addTag(just_the_name)
        }
      },
    }
  )
})

/*system.runInterval(() => {
  const ent = "the_ore_finder_project:coal_ore_entity"

  for (let p of world.getPlayers()) {
    const range = 20

    for (let x = range * -1; x <= range; x++) {
      for (let y = range * -1; y <= range; y++) {
        for (let z = range * -1; z <= range; z++) {
          let pos = p.location
          pos.x += x
          pos.y += y
          pos.z += z

          let block = p.dimension.getBlock(pos)
          if (block) {
            if (block.typeId == "minecraft:coal_ore") {
              let block_pos = block.location
              block_pos.x += 0.5
              //block_pos.y += 0.5 // only uncomment this to make the placholder poke out the top of the ore, used for testing material
              block_pos.z += 0.5
              let entlist = p.dimension.getEntitiesAtBlockLocation(block_pos)
              if (entlist.find((e) => e.typeId === ent) == undefined) {
                let ore = p.dimension.spawnEntity(ent, block_pos)
                //ore.addTag("torp_entity")
                //ore.addTag("visible")
              }
            }
          }
        }
      }
    }
  }
}, 20)

/*
Not using this to light things up, but there is some code for detecting items in slots that I want to keep

system.runInterval(() => {
  for (let p of world.getPlayers()) {
    let eq: any = p.getComponent(EntityEquippableComponent.componentId)
    let head = eq.getEquipment(EquipmentSlot.Head)

    let goggles = [
      "the_ore_finder_project:ancient_goggles",
      "the_ore_finder_project:budding_amethyst_goggles",
      "the_ore_finder_project:coal_ore_goggles",
      "the_ore_finder_project:copper_ore_goggles",
      "the_ore_finder_project:diamon_ore_goggles",
      "the_ore_finder_project:emerald_ore_goggles",
      "the_ore_finder_project:gold_ore_goggles",
      "the_ore_finder_project:iron_ore_goggles",
      "the_ore_finder_project:lapis_ore_goggles",
      "the_ore_finder_project:quartz_ore_goggles",
      "the_ore_finder_project:redstone_ore_goggles",
    ]

    for (let goggle of goggles) {
      // turn off all lights
      if (p.hasTag("head_light")) {
        p.removeTag("head_light")
        p.runCommandAsync(
          `execute as @s[hasitem={item=${goggle},location=slot.armor.head,quantity=0}] run function lights_off`
        )
      }

      if (head && !p.hasTag("head_light")) {
        // turn on light if it should be
        if (head.typeId == goggle) {
          p.addTag("head_light")
          p.runCommandAsync(
            `execute as @s positioned ~~1~ run function lights_on_9`
          )
        }
      }
    }
  }
})
*/
