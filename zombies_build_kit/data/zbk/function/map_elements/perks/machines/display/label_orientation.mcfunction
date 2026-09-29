# Keep the label aligned with the cabinet front, independent of the camera.
data modify entity @e[type=text_display,tag=pm_v2_label,tag=pm_v2_child,limit=1] Rotation set from entity @s Rotation
execute as @e[type=text_display,tag=pm_v2_label,tag=pm_v2_child,limit=1] at @s run rotate @s ~180 ~
