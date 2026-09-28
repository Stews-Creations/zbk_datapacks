# Position is the fixed marker center; current link selects its own breeze only.
$execute rotated $(yaw) 0 as @e[type=breeze,tag=de_storm_breeze] if score @s de_storm_link = #current de_storm_link run tp @s ^ ^ ^1.5 ~ 0
