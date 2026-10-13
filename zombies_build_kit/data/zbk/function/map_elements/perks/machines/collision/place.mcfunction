# A two-block solid core prevents walking through the cabinet.
# Reload repairs missing barriers without overwriting builder replacement blocks.
# Air and invisible light blocks count as clear; a light block inside the cabinet becomes a barrier.
execute if block ~ ~ ~ #zbk:perk_machine_clear run setblock ~ ~ ~ barrier
execute if block ~ ~1 ~ #zbk:perk_machine_clear run setblock ~ ~1 ~ barrier
