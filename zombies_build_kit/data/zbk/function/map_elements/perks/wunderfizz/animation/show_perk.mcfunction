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
execute if score @s wunderfizz_perk matches 0 run summon item_display ~ ~ ~ {Tags:["wunderfizz_display"],item:{id:"minecraft:potion",count:1,components:{item_model:"zbk:juggernog"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},billboard:"center"}

# Speed Cola (1)
execute if score @s wunderfizz_perk matches 1 run summon item_display ~ ~ ~ {Tags:["wunderfizz_display"],item:{id:"minecraft:potion",count:1,components:{item_model:"zbk:speed_cola"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},billboard:"center"}

# Double Tap (2)
execute if score @s wunderfizz_perk matches 2 run summon item_display ~ ~ ~ {Tags:["wunderfizz_display"],item:{id:"minecraft:potion",count:1,components:{item_model:"zbk:double_tap"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},billboard:"center"}

# Stamina Up (3)
execute if score @s wunderfizz_perk matches 3 run summon item_display ~ ~ ~ {Tags:["wunderfizz_display"],item:{id:"minecraft:potion",count:1,components:{item_model:"zbk:stamina_up"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},billboard:"center"}

# Quick Revive (4)
execute if score @s wunderfizz_perk matches 4 run summon item_display ~ ~ ~ {Tags:["wunderfizz_display"],item:{id:"minecraft:potion",count:1,components:{item_model:"zbk:quick_revive"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},billboard:"center"}

# Mule Kick (5)
execute if score @s wunderfizz_perk matches 5 run summon item_display ~ ~ ~ {Tags:["wunderfizz_display"],item:{id:"minecraft:potion",count:1,components:{item_model:"zbk:mule_kick"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.75f,0.75f,0.75f]},billboard:"center"}

# Add particle effects
particle minecraft:enchant ~ ~ ~ 0.3 0.3 0.3 0.5 10 force
