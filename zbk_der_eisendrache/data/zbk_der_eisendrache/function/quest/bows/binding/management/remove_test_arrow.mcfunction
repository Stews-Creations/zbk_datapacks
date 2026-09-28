$scoreboard players reset #$(quest) de_bow_owner
$scoreboard players reset #$(quest) de_bow_ready
$kill @e[tag=de_bow_$(quest)_runtime]
kill @s
$scoreboard players reset #$(quest) de_bow_started
