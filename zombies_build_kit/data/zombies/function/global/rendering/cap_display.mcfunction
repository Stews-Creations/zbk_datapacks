# Runs once for each unchecked loaded display; gameplay setters must respect the cap.
# Synchronous scratch value is overwritten for every entity.
execute store result score #display_range temp run data get entity @s view_range 10000
execute if score #display_range temp matches 5001.. run data merge entity @s {view_range:0.5f}
tag @s add zbk_range_checked
