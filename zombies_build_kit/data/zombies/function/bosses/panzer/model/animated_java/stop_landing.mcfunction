# Animated Java landing loop stop hook.
# Rewritten by tools/repair_de_panzer_after_export.js after manual exports.

# Hold the final landing frame until the paired golem reaches the ground.
scoreboard players set @s aj.animation_model_landing.frame 48
tag @s remove aj.de_panzer.animation.animation_model_landing.playing
scoreboard players set @s aj.tween_duration 0
tag @s add aj.transforms_only
execute at @s run function animated_java:de_panzer/animations/animation_model_landing/zzz/set_frame {frame: 48}
tag @s remove aj.transforms_only
