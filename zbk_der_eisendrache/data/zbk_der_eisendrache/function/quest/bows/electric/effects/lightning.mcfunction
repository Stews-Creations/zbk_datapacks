# === PLAYER-SAFE LIGHTNING ===
# Summons real lightning that damages zombies but not players

# Give all nearby players brief resistance (0.1 seconds = 2 ticks)
effect give @a[distance=..10] resistance 1 255 true

# Summon real lightning bolt
summon lightning_bolt ~ ~ ~

# Remove resistance after 2 ticks (scheduled)
schedule function zbk_der_eisendrache:quest/bows/electric/effects/lightning_cleanup 2t
