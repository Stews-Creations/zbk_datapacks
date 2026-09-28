# Animated Java death loop stop hook.
# Rewritten by tools/repair_de_panzer_after_export.js after manual exports.

# Hold the final death frame, then let bosses/panzer/on_tick remove the rig.
scoreboard players set @s aj.animation_model_die.frame 48
tag @s remove aj.de_panzer.animation.animation_model_die.playing
