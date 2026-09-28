# Called only after a qualifying nonlethal leg/ground hit, before conversion.
# Hard round gates also protect custom-health/test zombies on early rounds.
execute unless score #tier stats matches 1.. unless score #global wave.round matches 19.. run return 0
execute if score #tier stats matches 1.. unless score #global wave.round matches 31.. run return 0
# One in four eligible hits, independent of round. Damage already happened.
execute store result score #raygun_crawler_roll stats run random value 1..4 zombies:ray_gun_crawlers
execute if score #raygun_crawler_roll stats matches 1 run return 1
return 0
