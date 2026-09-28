# Summon preserves execution facing; explicitly copy it to the disposable marker.
tp @s ~ ~ ~ ~ ~
execute store result score #rs_angle temp run data get entity @s Rotation[0]
kill @s
