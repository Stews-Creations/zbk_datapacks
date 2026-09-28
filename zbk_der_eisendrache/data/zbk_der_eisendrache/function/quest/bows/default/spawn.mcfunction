# Spawn base-bow item_display at the persistent reward marker.
execute unless score #active zbk.de matches 1 run return 0
# Run at the bow spawn marker (called from dragon_heads/all_complete)

# Spawn the visual bow display (enchant shimmer, particles added via tick)
summon item_display ~ ~0.5 ~ {Tags:["quest_dragon_bow"],item:{id:"minecraft:bow",count:1,components:{"minecraft:item_model":"minecraft:bow","minecraft:enchantment_glint_override":false}},item_display:"fixed",transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.4f,0.4f,0.4f]},billboard:"center",brightness:{sky:15,block:15}}

# Spawn interaction entity for right-click detection
summon interaction ~ ~ ~ {Tags:["quest_dragon_bow_interaction"],width:1.0f,height:1.0f}

# Play spawn sound (completion sound already played by all_complete)
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1 1.2

# Particles for spawn effect
particle minecraft:end_rod ~ ~0.5 ~ 0.3 0.3 0.3 0.05 30 force
particle minecraft:happy_villager ~ ~0.5 ~ 0.5 0.5 0.5 0.1 20 force
