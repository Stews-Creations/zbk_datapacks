# ===================================
# BARRIER W3 PLAYER - DETECT REPAIR
# ===================================
# Context: Executed as @e[type=marker,tag=barrier_w3,scores={bw3_state=1..}] at @s

# Initialize cooldown score for players who don't have it
execute as @a[distance=..2] unless score @s barrier_repair_cooldown matches -2147483648..2147483647 run scoreboard players set @s barrier_repair_cooldown 0

# Check for genuinely grounded sneaking players within 2 blocks with no cooldown.
execute as @a[distance=..2,predicate=zbk:is_sneaking,nbt={OnGround:1b},scores={barrier_repair_cooldown=..0}] at @s positioned as @e[type=marker,tag=barrier_w3,distance=..2,scores={bw3_state=1..},limit=1,sort=nearest] run function zbk:map_elements/barrier_w3/player/repair_barrier
