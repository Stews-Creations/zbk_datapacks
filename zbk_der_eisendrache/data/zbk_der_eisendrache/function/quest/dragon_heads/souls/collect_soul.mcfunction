# Collect a soul for a Dragon Head
# Run as dragon head (1, 2, or 3), at stone location (death position)

# Increment soul count
scoreboard players add @s dragon_head_souls 1

# Debug message (generic)
execute as @a[distance=..15,tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"[DRAGON] Soul detected! Count: ","color":"light_purple"},{"score":{"name":"@s","objective":"dragon_head_souls"},"color":"gold"}]

# Set cooldown to 70 ticks
scoreboard players set @s dragon_head_cooldown 70

# Prime idle timer so next idle sound plays shortly after cooldown ends
scoreboard players set @s dragon_idle_sound 170

# Spawn soul mannequin with target tag based on which head this is
function zbk_der_eisendrache:quest/dragon_heads/souls/spawn_soul_mannequin
