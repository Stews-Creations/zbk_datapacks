# ===================================
# BUILD KIT MODULE - LOAD
# ===================================
# Initializes build kit trigger system

# Build kit triggers are initialized in their respective modules
# (combat, player, map_elements, etc.)

# Buildables dialog actions
scoreboard objectives add buildables_action trigger

# Build Manager tool
scoreboard objectives add build_manager_trigger_lock dummy
scoreboard objectives add build_manager_pending dummy
scoreboard objectives add give_build_manager trigger
scoreboard objectives add build_manager_opener dummy

# Mob Immunity Tool
scoreboard objectives add mob_immunity_tool_mode dummy
scoreboard objectives add mob_immunity_tool_pending dummy
scoreboard objectives add mob_immunity_tool_lock dummy
scoreboard objectives add mob_immunity_tool_hurt dummy
scoreboard objectives add give_mob_immunity_tool trigger

# Debug Mode toggle trigger
scoreboard objectives add toggle_dev_tag trigger

# Debug Level setting (1=errors, 2=+warnings, 3=+events, 4=all)
scoreboard objectives add debug_level dummy
scoreboard objectives add set_debug_level trigger

# Initialize zone highlight to off (-1)
scoreboard players set #highlight_zone global -1

# Gun visibility toggle (for creative/building mode)
scoreboard objectives add toggle_gun trigger
scoreboard objectives add hide_gun dummy


# Initialize per-player defaults and trigger enables
execute as @a run function zbk:build_kit/initialize
scoreboard objectives add cb_edit dummy
