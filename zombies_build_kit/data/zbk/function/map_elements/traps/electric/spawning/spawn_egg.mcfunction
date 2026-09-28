# === GIVE ELECTRIC TRAP FRAME KIT ===

# Named/Tagged frame items are the markers
give @s minecraft:glow_item_frame[custom_name=[{"text":"Trap Bottom Left Frame","italic":false,"color":"light_purple"}],custom_data={trap_frame:1b,placement_marker:1b,placement_type:"trap",placement_variant:"corner_1"}] 1
give @s minecraft:glow_item_frame[custom_name=[{"text":"Trap Top Right Frame","italic":false,"color":"aqua"}],custom_data={trap_frame:1b,placement_marker:1b,placement_type:"trap",placement_variant:"corner_2"}] 1
give @s minecraft:glow_item_frame[custom_name=[{"text":"Trap Sign Frame","italic":false,"color":"gold"}],custom_data={trap_frame:1b,placement_marker:1b,placement_type:"trap",placement_variant:"sign"}] 1

execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[TRAP] ","color":"green"},{"text":"Place the named glow item frames directly to create trap corners/sign.","color":"gold"}]
