# Completion core functions for the later crafting step; never called by eligibility alone.
$execute unless score #$(recipe) cb_build matches 1 run return 0
$scoreboard players set #$(recipe) cb_build 2
