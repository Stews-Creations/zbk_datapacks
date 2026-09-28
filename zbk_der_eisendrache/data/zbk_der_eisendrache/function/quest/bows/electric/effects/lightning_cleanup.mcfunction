# Effect cleanup must remain callable after the originating map has been deselected.
# === LIGHTNING CLEANUP ===
# Removes resistance effect after lightning strike

effect clear @a[distance=..10] resistance
