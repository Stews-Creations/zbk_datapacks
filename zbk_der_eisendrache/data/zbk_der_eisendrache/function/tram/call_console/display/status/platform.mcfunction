# Runs as the status text only when its visible state changes.
data modify entity @s text set value [{"text":"AT PLATFORM","color":"green","bold":true}]
tag @s remove tram_call_console_status_call
tag @s remove tram_call_console_status_moving
tag @s add tram_call_console_status_platform
