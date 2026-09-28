# Run as a generated mystery_box block-display carrier.
# Configure visible ranges; animation transforms remain generated.
execute on passengers if entity @s[type=item_display] run data merge entity @s {view_range:0.35f}
execute on passengers if entity @s[type=text_display,tag=mystery_box_10] run data merge entity @s {view_range:0.5f}
execute on passengers if entity @s[type=text_display,tag=mystery_box_35] run data merge entity @s {view_range:0.5f}
