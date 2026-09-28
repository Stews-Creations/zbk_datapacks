# === ASSIGN THROWER ID TO SNOWBALL ===
# Executed as the player who just threw a snowball (throw_snowball=1..)
# Store this player's ID on the nearest untagged snowball

execute store result entity @e[type=snowball,distance=..3,tag=!thrower_assigned,limit=1,sort=nearest] data.thrower_id int 1 run scoreboard players get @s id
tag @e[type=snowball,distance=..3,tag=!thrower_assigned,limit=1,sort=nearest] add thrower_assigned

# Reset throw counter
scoreboard players reset @s throw_snowball
