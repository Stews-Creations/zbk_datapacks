# Resolve Wall Gun display and purchase names without exposing Wall Gun-only IDs to Mystery Box.
execute unless score #gun_id temp matches 16 run function zombies:map_elements/mystery_box/guns/get_gun_name
execute if score #gun_id temp matches 16 run data modify storage zombies:temp gun_name set value "Bowie Knife"
