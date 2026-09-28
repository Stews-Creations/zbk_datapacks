# Remove existing back-display entities when loading the head-slot experiment.
execute in minecraft:overworld run kill @e[type=item_display,tag=rs_back_display]
execute in minecraft:the_nether run kill @e[type=item_display,tag=rs_back_display]
execute in minecraft:the_end run kill @e[type=item_display,tag=rs_back_display]
# Retire the previous chest-slot experiment when applying this change.
execute as @a if items entity @s armor.chest *[custom_data~{rs_chest_cosmetic:true}] run item replace entity @s armor.chest with minecraft:air
clear @a minecraft:paper[custom_data~{rs_chest_cosmetic:true}]
