# Repaired after Animated Java export for custom Panzer gameplay glue.
function animated_java:de_panzer/animations/pause_all
tag @s add aj.de_panzer.animation.animation_model_flame_thrower.playing
scoreboard players set @s aj.animation_model_flame_thrower.frame 0
scoreboard players set @s aj.tween_duration 0
tag @s add aj.transforms_only
execute at @s run function animated_java:de_panzer/animations/animation_model_flame_thrower/zzz/set_frame {frame: 0}
tag @s remove aj.transforms_only
