# Group only effects sharing this center position; retain the shared tick window for the extra burst.

# Presentation only; caller retains executor and sets marker position.
particle dust_color_transition{from_color:[0.290,0.455,1.000],to_color:[0.800,0.100,1.000],scale:1.2} ~ ~ ~ 5 5 5 0.01 25 normal
# particle end_rod ~ ~ ~ 5 5 5 0 12 normal
particle portal ~ ~ ~ 5 5 5 0.02 6 normal
execute if score #tick tick matches 0..5 run particle dust{color:[1.000,0.900,0.500],scale:2.5} ~ ~ ~ 1.5 1.5 1.5 0 10 normal
