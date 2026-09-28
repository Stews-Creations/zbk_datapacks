# Give the player the Mob Immunity Tool.

give @s minecraft:brush[custom_name={"text":"Mob Immunity Tool","color":"yellow","italic":false},lore=[[{"text":"Right-click: change mode","color":"gray","italic":false}],[{"text":"Left-click mob: apply mode","color":"gray","italic":false}]],custom_data={mob_immunity_tool:true},enchantment_glint_override=true,unbreakable={},attribute_modifiers=[{id:"mob_immunity_tiny_damage",type:"minecraft:attack_damage",amount:-0.5,operation:"add_value",slot:"mainhand"}],consumable={consume_seconds:1000000,animation:"none",has_consume_particles:false},use_effects={can_sprint:true,speed_multiplier:1.0}] 1
scoreboard players set @s mob_immunity_tool_mode 5
scoreboard players reset @s give_mob_immunity_tool
scoreboard players enable @s give_mob_immunity_tool
function zombies:build_kit/management/mob_immunity_tool/show_mode
