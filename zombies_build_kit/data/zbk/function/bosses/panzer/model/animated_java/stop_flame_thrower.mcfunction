# Animated Java flamethrower loop stop hook.
# Rewritten by tools/repair_de_panzer_after_export.js after manual exports.

tag @s remove aj.de_panzer.animation.animation_model_flame_thrower.playing
scoreboard players set @s aj.animation_model_flame_thrower.frame 34
scoreboard players set @s aj.tween_duration 0
tag @s add aj.transforms_only
execute at @s run function animated_java:de_panzer/animations/animation_model_flame_thrower/zzz/set_frame {frame: 34}
tag @s remove aj.transforms_only
