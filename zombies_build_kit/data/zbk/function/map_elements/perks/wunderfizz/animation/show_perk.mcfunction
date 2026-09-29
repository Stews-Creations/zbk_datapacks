# Cycle to next available perk (skip perks the buyer already has)
# Increment perk counter
scoreboard players add @s wunderfizz_perk 1

# Wrap around after 6 perks
execute if score @s wunderfizz_perk matches 6.. run scoreboard players set @s wunderfizz_perk 0

# Skip perks the buyer already has (loop multiple times to handle consecutive owned perks)
# First pass
execute if score @s wunderfizz_perk matches 0 if score @a[tag=wunderfizz_buyer,limit=1] perk_jugg matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 1 if score @a[tag=wunderfizz_buyer,limit=1] perk_speed matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 2 if score @a[tag=wunderfizz_buyer,limit=1] perk_doubletap matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 3 if score @a[tag=wunderfizz_buyer,limit=1] perk_stamina matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 4 if score @a[tag=wunderfizz_buyer,limit=1] perk_revive matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 5 if score @a[tag=wunderfizz_buyer,limit=1] perk_mule matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 6.. run scoreboard players set @s wunderfizz_perk 0

# Second pass (in case we landed on another owned perk)
execute if score @s wunderfizz_perk matches 0 if score @a[tag=wunderfizz_buyer,limit=1] perk_jugg matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 1 if score @a[tag=wunderfizz_buyer,limit=1] perk_speed matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 2 if score @a[tag=wunderfizz_buyer,limit=1] perk_doubletap matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 3 if score @a[tag=wunderfizz_buyer,limit=1] perk_stamina matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 4 if score @a[tag=wunderfizz_buyer,limit=1] perk_revive matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 5 if score @a[tag=wunderfizz_buyer,limit=1] perk_mule matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 6.. run scoreboard players set @s wunderfizz_perk 0

# Third pass (for cases with multiple consecutive owned perks)
execute if score @s wunderfizz_perk matches 0 if score @a[tag=wunderfizz_buyer,limit=1] perk_jugg matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 1 if score @a[tag=wunderfizz_buyer,limit=1] perk_speed matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 2 if score @a[tag=wunderfizz_buyer,limit=1] perk_doubletap matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 3 if score @a[tag=wunderfizz_buyer,limit=1] perk_stamina matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 4 if score @a[tag=wunderfizz_buyer,limit=1] perk_revive matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 5 if score @a[tag=wunderfizz_buyer,limit=1] perk_mule matches 1.. run scoreboard players add @s wunderfizz_perk 1
execute if score @s wunderfizz_perk matches 6.. run scoreboard players set @s wunderfizz_perk 0

# Kill existing displays
kill @e[type=item_display,tag=wunderfizz_display,distance=..2]
kill @e[type=text_display,tag=wunderfizz_perk_name,distance=..2]

# Summon new display based on current perk value (only show available perks)
# Juggernog (0)
execute if score @s wunderfizz_perk matches 0 run summon item_display ~ ~ ~ {Tags:["wunderfizz_display","pm_v2_preview"],item:{id:"minecraft:potion",count:1,components:{item_model:"zbk:perks/juggernog"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},billboard:"center"}

# Speed Cola (1)
execute if score @s wunderfizz_perk matches 1 run summon item_display ~ ~ ~ {Tags:["wunderfizz_display","pm_v2_preview"],item:{id:"minecraft:potion",count:1,components:{item_model:"zbk:perks/speed_cola"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},billboard:"center"}

# Double Tap (2)
execute if score @s wunderfizz_perk matches 2 run summon item_display ~ ~ ~ {Tags:["wunderfizz_display","pm_v2_preview"],item:{id:"minecraft:potion",count:1,components:{item_model:"zbk:perks/double_tap"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},billboard:"center"}

# Stamina Up (3)
execute if score @s wunderfizz_perk matches 3 run summon item_display ~ ~ ~ {Tags:["wunderfizz_display","pm_v2_preview"],item:{id:"minecraft:potion",count:1,components:{item_model:"zbk:perks/stamina_up"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},billboard:"center"}

# Quick Revive (4)
execute if score @s wunderfizz_perk matches 4 run summon item_display ~ ~ ~ {Tags:["wunderfizz_display","pm_v2_preview"],item:{id:"minecraft:potion",count:1,components:{item_model:"zbk:perks/quick_revive"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},billboard:"center"}

# Mule Kick (5)
execute if score @s wunderfizz_perk matches 5 run summon item_display ~ ~ ~ {Tags:["wunderfizz_display","pm_v2_preview"],item:{id:"minecraft:potion",count:1,components:{item_model:"zbk:perks/mule_kick"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},billboard:"center"}

# Model-machine bottles sit back inside the frame, below the nozzle.
execute if entity @s[tag=pm_v2] rotated as @s run tp @e[type=item_display,tag=pm_v2_preview] ^ ^-0.75 ^0.0875

# Keep the bottle aligned with the cabinet front, independent of the camera.
execute if entity @s[tag=pm_v2] run data merge entity @e[type=item_display,tag=pm_v2_preview,limit=1] {billboard:"fixed"}
execute if entity @s[tag=pm_v2] run data modify entity @e[type=item_display,tag=pm_v2_preview,limit=1] Rotation set from entity @s Rotation
execute if entity @s[tag=pm_v2] as @e[type=item_display,tag=pm_v2_preview] at @s run rotate @s ~180 ~

# Add particle effects
execute unless entity @s[tag=pm_v2] run particle minecraft:enchant ~ ~ ~ 0.3 0.3 0.3 0.5 10 force
execute if entity @s[tag=pm_v2] rotated as @s run particle minecraft:enchant ^ ^-0.75 ^0.0875 0.2 0.2 0.2 0.5 10 force

execute if entity @s[tag=pm_v2] run tag @e[tag=pm_v2_preview] add pm_v2_runtime
execute if entity @s[tag=pm_v2] run scoreboard players operation @e[tag=pm_v2_preview] pm_v2_id = @s pm_v2_id
tag @e[tag=pm_v2_preview] remove pm_v2_preview
