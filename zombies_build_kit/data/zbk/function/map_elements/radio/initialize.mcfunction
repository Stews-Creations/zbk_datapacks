# Apply rendering defaults to loaded radio assemblies.
execute as @e[type=block_display,tag=radio_display] run data merge entity @s {view_range:0.5f}
execute as @e[type=block_display,tag=radio_display] on passengers run data merge entity @s {view_range:0.5f}
