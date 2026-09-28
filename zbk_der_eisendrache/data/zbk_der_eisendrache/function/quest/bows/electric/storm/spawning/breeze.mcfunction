# Visual-only giant breeze; never enters the older prototype damage loop.
data merge entity @s {NoAI:1b,NoGravity:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b}
tag @s add de_storm_breeze
tag @s add combat_ignore
team join no_friendly_fire_team @s
attribute @s minecraft:scale base set 5
scoreboard players operation @s de_storm_link = #next de_storm_link
effect give @s minecraft:invisibility infinite 0 true
