# Keep price and claim labels renderable, including boxes loaded after initialize.
# Generated animation transforms control when each label is shown or hidden.
execute as @e[type=text_display,tag=mystery_box_10] unless entity @s[nbt={view_range:0.5f}] run data merge entity @s {view_range:0.5f}
execute as @e[type=text_display,tag=mystery_box_35] unless entity @s[nbt={view_range:0.5f}] run data merge entity @s {view_range:0.5f}
