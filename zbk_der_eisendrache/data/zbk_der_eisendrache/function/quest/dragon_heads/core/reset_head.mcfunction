# Reset a large dragon head to stone mode (called as @s)
scoreboard players set @s dragon_head_mode 0
scoreboard players set @s dragon_head_souls 0
scoreboard players set @s dragon_head_cooldown 0
scoreboard players set @s dragon_head_anim 0
data merge entity @s {brightness:{sky:0,block:0}}
data merge entity @s {view_range:0.5f}
