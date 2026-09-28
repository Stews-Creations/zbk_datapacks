# Context: cutscene camera; nested player work must not replace the camera executor.
# Latch the milestone on that camera after showing the combat record.

execute as @a run function zombies:player/stats/dialog/show
tag @s add cs_showed_dialog
