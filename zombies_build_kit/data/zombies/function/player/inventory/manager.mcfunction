# ===================================
# PLAYER INVENTORY MANAGEMENT
# ===================================
# Centralized inventory handling for playable hotbar slots
# Called every tick from main tick loop

# Hotbar layout:
# Slot 3 (key 4): Knife or Bowie Knife (custom knife item)
# Slot 4 (key 5): Monkey Bombs or Trip Mines
# Slots 5-6 (keys 6-7): locked Shield/Ragnarok HUD positions; real items are preserved
# Other slots: free for map and player use
# Offhand: Active weapon (M1911, Shotgun, or Raygun)

# Apply all inventory forcing
function zombies:player/inventory/equipment/cleanup
function zombies:player/inventory/weapons
function zombies:player/inventory/equipment/clear_reload_bar
function zombies:player/actionbar/reload/tick
function zombies:player/inventory/special_equipment

function zbk:dispatch/inventory_update
