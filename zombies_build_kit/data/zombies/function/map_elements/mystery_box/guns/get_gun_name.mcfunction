function zombies:combat/weapons/guns/bo3/migration/id
execute if score #gun_id temp matches 20..46 run return run function zombies:combat/weapons/guns/bo3/registry/name
# Convert gun ID to name and store in storage
# Input: #gun_id temp (weapon ID)
# Output: zombies:temp gun_name (string)

execute if score #gun_id temp matches 1 run data modify storage zombies:temp gun_name set value "Double Barrel Shotgun"
execute if score #gun_id temp matches 2 run data modify storage zombies:temp gun_name set value "Flame Thrower"
execute if score #gun_id temp matches 3 run data modify storage zombies:temp gun_name set value "Grenade Launcher"
execute if score #gun_id temp matches 4 run data modify storage zombies:temp gun_name set value "Light Machine Gun"
execute if score #gun_id temp matches 5 run data modify storage zombies:temp gun_name set value "Pistol"
execute if score #gun_id temp matches 6 run data modify storage zombies:temp gun_name set value "Rainbow Rifle"
execute if score #gun_id temp matches 7 run data modify storage zombies:temp gun_name set value "Ray Gun"
execute if score #gun_id temp matches 8 run data modify storage zombies:temp gun_name set value "Rifle"
execute if score #gun_id temp matches 9 run data modify storage zombies:temp gun_name set value "Shotgun"
execute if score #gun_id temp matches 10 run data modify storage zombies:temp gun_name set value "Sniper"
execute if score #gun_id temp matches 13 run data modify storage zombies:temp gun_name set value "Grenades"
execute if score #gun_id temp matches 14 run data modify storage zombies:temp gun_name set value "Monkey Bombs"
execute if score #gun_id temp matches 15 run data modify storage zombies:temp gun_name set value "Trip Mines"
