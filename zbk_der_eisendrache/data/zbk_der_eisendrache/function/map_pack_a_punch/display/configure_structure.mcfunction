execute unless score #active zbk.de matches 1 run return 0
# Run as a structure display; preserve any deliberately hidden state.
execute if entity @s[type=item_display] unless entity @s[nbt={view_range:0f}] run data merge entity @s {view_range:0.5f}
execute if entity @s[type=block_display] unless entity @s[nbt={view_range:0f}] run data merge entity @s {view_range:0.5f}
execute if entity @s[type=text_display] unless entity @s[nbt={view_range:0f}] run data merge entity @s {view_range:0.5f}
execute on passengers run function zbk_der_eisendrache:map_pack_a_punch/display/configure_structure
