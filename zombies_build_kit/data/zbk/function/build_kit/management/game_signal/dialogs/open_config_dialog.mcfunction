# Route to type-specific config dialog using the open_dialog tag set by dispatch
execute if entity @e[tag=open_dialog,tag=signal_game_start,limit=1] run function zbk:build_kit/management/game_signal/dialogs/show_game_start
execute if entity @e[tag=open_dialog,tag=signal_game_end,limit=1] run function zbk:build_kit/management/game_signal/dialogs/show_game_end
execute if entity @e[tag=open_dialog,tag=signal_round_start,limit=1] run function zbk:build_kit/management/game_signal/dialogs/show_round_start
execute if entity @e[tag=open_dialog,tag=signal_power_on,limit=1] run function zbk:build_kit/management/game_signal/dialogs/show_power_on
execute if entity @e[tag=open_dialog,tag=signal_zone_unlocked,limit=1] run function zbk:build_kit/management/game_signal/dialogs/show_zone_unlocked
