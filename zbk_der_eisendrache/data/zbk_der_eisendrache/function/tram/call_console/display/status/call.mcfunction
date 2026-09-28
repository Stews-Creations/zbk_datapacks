# Runs as the status text only when its visible state changes.
data modify entity @s text set value [{"text":"CALL TRAM","color":"gold","bold":true}]
tag @s remove tram_call_console_status_moving
tag @s remove tram_call_console_status_platform
tag @s add tram_call_console_status_call
