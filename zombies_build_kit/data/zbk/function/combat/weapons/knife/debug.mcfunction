# Debug knife damage system
tellraw @s [{"text":"[Knife Debug]","color":"gold"}]
tellraw @s [{"text":"Current Round: ","color":"white"},{"score":{"name":"#global","objective":"wave.round"},"color":"yellow"}]
tellraw @s [{"text":"Knife Damage: ","color":"white"},{"score":{"name":"#global","objective":"knife.damage"},"color":"green"}]
tellraw @s [{"text":"Zombie Health: ","color":"white"},{"score":{"name":"#global","objective":"wave.health"},"color":"red"}]

# Show storage contents
data get storage zbk:temp
