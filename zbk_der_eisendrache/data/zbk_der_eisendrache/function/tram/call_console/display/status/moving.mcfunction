# Runs as the status text only when its visible state changes.
data modify entity @s text set value [{"text":"TRAM MOVING","color":"yellow","bold":true}]
tag @s remove tram_call_console_status_call
tag @s remove tram_call_console_status_platform
tag @s add tram_call_console_status_moving
