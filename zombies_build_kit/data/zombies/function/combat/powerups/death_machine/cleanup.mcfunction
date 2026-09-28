# Per-player cleanup (called AS the affected player from: timer expiry, F-cancel, down, death).
execute at @s run stopsound @a[distance=..64] player zombies:guns.death_machine_a
execute at @s run stopsound @a[distance=..64] player zombies:guns.death_machine_b
item replace entity @s weapon.offhand with minecraft:air
tag @s remove death_machine_active
scoreboard players set @s dm_timer 0
scoreboard players set @s dm_sound_cooldown 0
scoreboard players set @s dm_firing 0
scoreboard players set @s dm_sound_alt 0

# Force-revoke the using_item advancement so it doesn't get stuck granted (which would prevent on_use from re-firing next activation).
advancement revoke @s only zombies:death_machine
