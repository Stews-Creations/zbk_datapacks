# Read current length and show end game timed config dialog
execute store result storage zbk:temp cutscene.length int 1 run data get entity @e[type=marker,tag=cutscene_end_timed,limit=1] data.length
function zbk:build_kit/management/cutscenes/dialogs/show_end_timed with storage zbk:temp cutscene
