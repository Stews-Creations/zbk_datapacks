# Give an item-frame based marker item for power lamps.
give @s minecraft:glow_item_frame[custom_name=[{"text":"Power Lamp Marker Frame","italic":false,"color":"gold"}],custom_data={placement_marker:1b,placement_type:"block_power_lamp"}] 1
execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[Blocks] ","color":"gold"},{"text":"Place the glow frame where the power lamp marker should go.","color":"yellow"}]
