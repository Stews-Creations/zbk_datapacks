# Initialize wolf painting quest
# Called on game start to randomly place 4 wolf painting entities at spawn location markers

# Kill any existing wolf painting entities from previous games and summon fresh ones
kill @e[type=marker,tag=wolf_painting]
function zbk_der_eisendrache:quest/wolf/summon

# Randomize their placements to spawn location markers
function zbk_der_eisendrache:quest/wolf/randomize_placements

# Log initialization
tellraw @a[tag=debug] [{"text":"Wolf quest initialized","color":"green"}]
