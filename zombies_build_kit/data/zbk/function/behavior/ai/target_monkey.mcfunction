# Reuse only the presence result: each enemy still chooses its own nearest decoy.
# The caller has already computed #anger_end_time; this helper must not reset it.

# Called as and at an enemy after anger confirms a loaded decoy with the original selector scope.
data modify entity @s angry_at set from entity @e[type=zombie,tag=monkey_bomb_decoy,sort=nearest,limit=1] UUID
execute store result entity @s anger_end_time long 1 run scoreboard players get #anger_end_time temp
tag @s remove has_decoy_target
return 0
