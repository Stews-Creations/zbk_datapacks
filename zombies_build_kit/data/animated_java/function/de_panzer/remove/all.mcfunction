# Repaired after Animated Java export for custom Panzer gameplay glue.
function zbk:bosses/panzer/model/animated_java/on_remove_all
execute as @e[type=minecraft:item_display,tag=aj.de_panzer.root] run function animated_java:de_panzer/remove/this
