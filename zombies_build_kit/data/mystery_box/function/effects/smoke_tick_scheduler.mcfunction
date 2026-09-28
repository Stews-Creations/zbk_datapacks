# ===================================
# SMOKE TICK SCHEDULER
# ===================================
# Called every tick to continue all smoke effects
# ===================================

execute as @e[type=marker,tag=mystery_box_smoke_effect] run function mystery_box:effects/smoke_tick

# Keep scheduling as long as there are active effects
execute if entity @e[type=marker,tag=mystery_box_smoke_effect,limit=1] run schedule function mystery_box:effects/smoke_tick_scheduler 1t
