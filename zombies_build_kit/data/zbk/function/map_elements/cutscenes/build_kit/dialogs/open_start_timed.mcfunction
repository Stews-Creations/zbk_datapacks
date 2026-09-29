# Read current length and show start game timed config dialog
execute store result storage zbk:temp cutscene.length int 1 run data get entity @e[type=marker,tag=cutscene_start_timed,limit=1] data.length
function zbk:map_elements/cutscenes/build_kit/dialogs/show_start_timed with storage zbk:temp cutscene
