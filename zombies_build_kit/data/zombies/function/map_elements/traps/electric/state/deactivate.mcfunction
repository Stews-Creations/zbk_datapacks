# === DEACTIVATE ELECTRIC TRAP ===
# Called when trap timer reaches 0
# Transitions trap to cooldown state

# Remove active tag and add cooldown tag
tag @s remove trap_active
tag @s add trap_cooldown

# Set cooldown timer from sign data (seconds * 20 = ticks), fallback 900 ticks
execute at @s store result score #trap_cd global run data get entity @e[type=marker,tag=trap_sign,distance=..100,limit=1,sort=nearest] data.cooldown 20
execute unless score #trap_cd global matches 1.. run scoreboard players set #trap_cd global 900
scoreboard players operation @s trap_timer = #trap_cd global

# Visual and audio effects
particle minecraft:smoke ~ ~1 ~ 1.5 1 1.5 0.05 30 force
particle minecraft:large_smoke ~ ~1 ~ 1 0.5 1 0.02 10 force
playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 1 0.8
playsound minecraft:entity.lightning_bolt.impact master @a ~ ~ ~ 0.5 0.5

# Message nearby players (only from corner1 to avoid duplicate)
execute if entity @s[tag=trap_corner1] as @a[distance=..15,tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[TRAP] ","color":"gold"},{"text":"Electric Trap deactivated. Recharging...","color":"gray"}]
