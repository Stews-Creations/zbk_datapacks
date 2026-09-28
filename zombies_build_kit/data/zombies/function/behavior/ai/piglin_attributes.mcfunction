# Shared anger/targeting
function zombies:behavior/ai/anger

# Baby variants (crawlers) move at half speed
execute if entity @a[gamemode=adventure,team=!downed,distance=..20] if entity @s[tag=crawler_ai] run attribute @s movement_speed base set 0.115
