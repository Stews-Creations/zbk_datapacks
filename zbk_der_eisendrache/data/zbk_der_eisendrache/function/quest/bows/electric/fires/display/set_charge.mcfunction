# Context: one fire effect marker; id is supplied by its owning persistent marker.
# Reset before applying charge so an extinguished charge cannot leave stale presentation state.

scoreboard players set @s de_ec_fire 0
$execute if score #$(id) de_ec_fire matches 1 run scoreboard players set @s de_ec_fire 1
