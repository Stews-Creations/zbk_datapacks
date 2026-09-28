# Repaired after Animated Java export for custom Panzer gameplay glue.
execute unless entity @s[tag=aj.de_panzer.root] run return 0
function zbk:bosses/panzer/model/animated_java/root_tick
execute if entity @s[tag=aj.de_panzer.animation.animation_model_landing.playing] run function animated_java:de_panzer/animations/animation_model_landing/zzz/on_tick
execute if entity @s[tag=aj.de_panzer.animation.animation_model_walk.playing] run function animated_java:de_panzer/animations/animation_model_walk/zzz/on_tick
execute if entity @s[tag=aj.de_panzer.animation.animation_model_melee.playing] run function animated_java:de_panzer/animations/animation_model_melee/zzz/on_tick
execute if entity @s[tag=aj.de_panzer.animation.animation_model_range_attack.playing] run function animated_java:de_panzer/animations/animation_model_range_attack/zzz/on_tick
execute if entity @s[tag=aj.de_panzer.animation.animation_model_flame_thrower.playing] run function animated_java:de_panzer/animations/animation_model_flame_thrower/zzz/on_tick
execute if entity @s[tag=aj.de_panzer.animation.animation_model_die.playing] run function animated_java:de_panzer/animations/animation_model_die/zzz/on_tick
execute on passengers run rotate @s ~ ~
