# ===================================
# BARRIER PLAYER - DETECT REPAIR
# ===================================
# Purpose: Detect sneaking players near damaged barriers and trigger repair
#
# Context: Executed as @e[type=marker,tag=barrier,scores={barrier_state=1..}] at @s
# ===================================

# ===== DETECT SNEAKING PLAYERS =====
# Initialize cooldown score for players who don't have it
execute as @a[distance=..2] unless score @s barrier_repair_cooldown matches -2147483648..2147483647 run scoreboard players set @s barrier_repair_cooldown 0

# Check for genuinely grounded sneaking players within 2 blocks with no cooldown.
execute as @a[distance=..2,predicate=zombies:is_sneaking,nbt={OnGround:1b},scores={barrier_repair_cooldown=..0}] at @s positioned as @e[type=marker,tag=barrier,distance=..2,scores={barrier_state=1..},limit=1,sort=nearest] run function zombies:map_elements/barrier/player/repair_barrier
