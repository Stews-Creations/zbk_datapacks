# === READY ELECTRIC TRAP ===
# Called when cooldown finishes
# Makes trap ready for purchase again

# Remove cooldown tag (corners are now ready to be activated again)
tag @s remove trap_cooldown

# Reset timer
scoreboard players set @s trap_timer 0

# Visual and audio effects
particle minecraft:end_rod ~ ~1 ~ 0.5 0.5 0.5 0.05 20 force
particle minecraft:glow ~ ~0.5 ~ 0.3 0.3 0.3 0.02 10 force
playsound zombies:traps.available master @a ~ ~ ~ 0.2 1

# Message nearby players
execute as @a[distance=..15,tag=debug,scores={debug_level=3..}] run tellraw @s [{"text":"[TRAP] ","color":"green"},{"text":"Electric Trap ready!","color":"gold"}]
