# === WEAPON TIMER SYSTEM ===
# Handles cooldowns, burst firing, and reload timers for all weapon slots

# --- Element cooldowns ---
execute as @a[scores={bf_cooldown=1..}] run scoreboard players remove @s bf_cooldown 1
execute as @a[scores={tw_cooldown=1..}] run scoreboard players remove @s tw_cooldown 1
execute as @a[scores={fw_cooldown=1..}] run scoreboard players remove @s fw_cooldown 1
execute as @a[scores={dw_cooldown=1..}] run scoreboard players remove @s dw_cooldown 1

# --- Slot 1 Timers ---
# Decrement cooldown
execute as @a[scores={cooldown_1=1..}] run scoreboard players remove @s cooldown_1 1

# Decrement burst fire interval
execute as @a[scores={fire_1=1..}] run scoreboard players remove @s fire_1 1

# Execute burst shot when interval reaches 0 and shots remaining
execute as @a[scores={fire_1=0,shots_1=1..}] run function zbk:combat/weapons/mechanics/burst/burst_shot_1

# Decrement reload timer
execute as @a[scores={reload_timer_1=1..}] run scoreboard players remove @s reload_timer_1 1

# Complete reload when timer reaches 0
execute as @a[scores={reload_timer_1=0,is_reloading_1=1}] run function zbk:combat/weapons/reload/complete_reload_slot_1


# --- Slot 2 Timers ---
# Decrement cooldown
execute as @a[scores={cooldown_2=1..}] run scoreboard players remove @s cooldown_2 1

# Decrement burst fire interval
execute as @a[scores={fire_2=1..}] run scoreboard players remove @s fire_2 1

# Execute burst shot when interval reaches 0 and shots remaining
execute as @a[scores={fire_2=0,shots_2=1..}] run function zbk:combat/weapons/mechanics/burst/burst_shot_2

# Decrement reload timer
execute as @a[scores={reload_timer_2=1..}] run scoreboard players remove @s reload_timer_2 1

# Complete reload when timer reaches 0
execute as @a[scores={reload_timer_2=0,is_reloading_2=1}] run function zbk:combat/weapons/reload/complete_reload_slot_2


# --- Slot 3 Timers ---
# Decrement cooldown
execute as @a[scores={cooldown_3=1..}] run scoreboard players remove @s cooldown_3 1

# Decrement burst fire interval
execute as @a[scores={fire_3=1..}] run scoreboard players remove @s fire_3 1

# Execute burst shot when interval reaches 0 and shots remaining
execute as @a[scores={fire_3=0,shots_3=1..}] run function zbk:combat/weapons/mechanics/burst/burst_shot_3

# Decrement reload timer
execute as @a[scores={reload_timer_3=1..}] run scoreboard players remove @s reload_timer_3 1

# Complete reload when timer reaches 0
execute as @a[scores={reload_timer_3=0,is_reloading_3=1}] run function zbk:combat/weapons/reload/complete_reload_slot_3
