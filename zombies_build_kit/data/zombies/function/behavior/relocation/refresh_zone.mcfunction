# Context: selected spawner, with the relocation anchor position retained by the caller.
# Reset before reading so missing configuration cannot inherit a previous zone value.

scoreboard players set @s relocation_zone -1
execute store result score @s relocation_zone run data get entity @s data.zone
