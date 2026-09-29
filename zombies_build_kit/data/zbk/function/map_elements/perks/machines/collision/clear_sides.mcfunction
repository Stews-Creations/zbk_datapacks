# Remove only side cells recorded by this marker, preserving replacement blocks.
execute if data entity @s data.pm_collision.xn0 if block ~-1 ~0 ~0 magenta_stained_glass_pane run setblock ~-1 ~0 ~0 air
execute if data entity @s data.pm_collision.xn1 if block ~-1 ~1 ~0 magenta_stained_glass_pane run setblock ~-1 ~1 ~0 air
execute if data entity @s data.pm_collision.xp0 if block ~1 ~0 ~0 magenta_stained_glass_pane run setblock ~1 ~0 ~0 air
execute if data entity @s data.pm_collision.xp1 if block ~1 ~1 ~0 magenta_stained_glass_pane run setblock ~1 ~1 ~0 air
execute if data entity @s data.pm_collision.zn0 if block ~0 ~0 ~-1 magenta_stained_glass_pane run setblock ~0 ~0 ~-1 air
execute if data entity @s data.pm_collision.zn1 if block ~0 ~1 ~-1 magenta_stained_glass_pane run setblock ~0 ~1 ~-1 air
execute if data entity @s data.pm_collision.zp0 if block ~0 ~0 ~1 magenta_stained_glass_pane run setblock ~0 ~0 ~1 air
execute if data entity @s data.pm_collision.zp1 if block ~0 ~1 ~1 magenta_stained_glass_pane run setblock ~0 ~1 ~1 air
data remove entity @s data.pm_collision
