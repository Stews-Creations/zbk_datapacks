# Only the thrower takes grenade self-damage; explode captured its stable ID.
execute if score @s id = #shooter_id stats run function zombies:combat/weapons/grenade/damage/handle_self_damage
