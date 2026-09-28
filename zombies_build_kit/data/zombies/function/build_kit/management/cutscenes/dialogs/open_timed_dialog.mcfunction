# Open timed cutscene marker config dialog
# Reads length from marker data, then opens macro dialog

# Read current length from the marker (preserve float for 0.25s precision)
data modify storage zombies:temp cutscene.length set from entity @e[tag=open_dialog,limit=1] data.length

# Detect which type and store it
data modify storage zombies:temp cutscene.type set value "end"
execute if entity @e[tag=open_dialog,tag=cutscene_start_timed,limit=1] run data modify storage zombies:temp cutscene.type set value "start"

# Remove tag
tag @e[tag=open_dialog] remove open_dialog

# Show the appropriate dialog
execute if data storage zombies:temp cutscene{type:"end"} run function zombies:build_kit/management/cutscenes/dialogs/show_end_timed with storage zombies:temp cutscene
execute if data storage zombies:temp cutscene{type:"start"} run function zombies:build_kit/management/cutscenes/dialogs/show_start_timed with storage zombies:temp cutscene
