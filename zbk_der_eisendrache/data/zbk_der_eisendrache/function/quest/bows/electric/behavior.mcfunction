# === BREEZE BEHAVIOR ===
# Make breeze invisible, immune, non-solid with flat cloud ring effect

# Initialize timer and store spawn position (only once)
execute unless score @s timer matches 0.. run scoreboard players set @s timer 200
execute unless score @s timer matches 0.. run tp @s ~ ~ ~ facing entity @p

# Store initial position markers if not already stored
execute unless entity @s[tag=breeze_positioned] at @s run summon marker ~ ~ ~ {Tags:["breeze_center"]}
execute unless entity @s[tag=breeze_positioned] run tag @s add breeze_positioned

# Countdown timer
scoreboard players remove @s timer 1

# Move in a smooth circle (1.5 block radius) - moves 0.2 blocks per tick
# Approximates circular motion by moving tangentially each tick
# Position 0 (timer 200): East (1.5, 0)
# Position 1 (timer 190): Southeast (1.3, 0.75)
# Position 2 (timer 180): South-Southeast (0.75, 1.3)
# ... and so on around the circle

# Calculate smooth movement based on timer (200 positions for smooth circle)
execute if score @s timer matches 199 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.5 ~ ~
execute if score @s timer matches 198 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.49 ~ ~0.15
execute if score @s timer matches 197 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.47 ~ ~0.30
execute if score @s timer matches 196 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.43 ~ ~0.45
execute if score @s timer matches 195 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.38 ~ ~0.59
execute if score @s timer matches 194 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.32 ~ ~0.72
execute if score @s timer matches 193 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.24 ~ ~0.85
execute if score @s timer matches 192 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.16 ~ ~0.96
execute if score @s timer matches 191 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.06 ~ ~1.06
execute if score @s timer matches 190 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.96 ~ ~1.16
execute if score @s timer matches 189 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.85 ~ ~1.24
execute if score @s timer matches 188 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.72 ~ ~1.32
execute if score @s timer matches 187 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.59 ~ ~1.38
execute if score @s timer matches 186 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.45 ~ ~1.43
execute if score @s timer matches 185 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.30 ~ ~1.47
execute if score @s timer matches 184 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.15 ~ ~1.49
execute if score @s timer matches 183 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~ ~ ~1.5
execute if score @s timer matches 182 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.15 ~ ~1.49
execute if score @s timer matches 181 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.30 ~ ~1.47
execute if score @s timer matches 180 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.45 ~ ~1.43
execute if score @s timer matches 179 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.59 ~ ~1.38
execute if score @s timer matches 178 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.72 ~ ~1.32
execute if score @s timer matches 177 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.85 ~ ~1.24
execute if score @s timer matches 176 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.96 ~ ~1.16
execute if score @s timer matches 175 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.06 ~ ~1.06
execute if score @s timer matches 174 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.16 ~ ~0.96
execute if score @s timer matches 173 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.24 ~ ~0.85
execute if score @s timer matches 172 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.32 ~ ~0.72
execute if score @s timer matches 171 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.38 ~ ~0.59
execute if score @s timer matches 170 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.43 ~ ~0.45
execute if score @s timer matches 169 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.47 ~ ~0.30
execute if score @s timer matches 168 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.49 ~ ~0.15
execute if score @s timer matches 167 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.5 ~ ~
execute if score @s timer matches 166 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.49 ~ ~-0.15
execute if score @s timer matches 165 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.47 ~ ~-0.30
execute if score @s timer matches 164 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.43 ~ ~-0.45
execute if score @s timer matches 163 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.38 ~ ~-0.59
execute if score @s timer matches 162 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.32 ~ ~-0.72
execute if score @s timer matches 161 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.24 ~ ~-0.85
execute if score @s timer matches 160 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.16 ~ ~-0.96
execute if score @s timer matches 159 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.06 ~ ~-1.06
execute if score @s timer matches 158 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.96 ~ ~-1.16
execute if score @s timer matches 157 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.85 ~ ~-1.24
execute if score @s timer matches 156 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.72 ~ ~-1.32
execute if score @s timer matches 155 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.59 ~ ~-1.38
execute if score @s timer matches 154 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.45 ~ ~-1.43
execute if score @s timer matches 153 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.30 ~ ~-1.47
execute if score @s timer matches 152 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.15 ~ ~-1.49
execute if score @s timer matches 151 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~ ~ ~-1.5
execute if score @s timer matches 150 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.15 ~ ~-1.49
execute if score @s timer matches 149 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.30 ~ ~-1.47
execute if score @s timer matches 148 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.45 ~ ~-1.43
execute if score @s timer matches 147 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.59 ~ ~-1.38
execute if score @s timer matches 146 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.72 ~ ~-1.32
execute if score @s timer matches 145 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.85 ~ ~-1.24
execute if score @s timer matches 144 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.96 ~ ~-1.16
execute if score @s timer matches 143 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.06 ~ ~-1.06
execute if score @s timer matches 142 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.16 ~ ~-0.96
execute if score @s timer matches 141 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.24 ~ ~-0.85
execute if score @s timer matches 140 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.32 ~ ~-0.72
execute if score @s timer matches 139 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.38 ~ ~-0.59
execute if score @s timer matches 138 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.43 ~ ~-0.45
execute if score @s timer matches 137 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.47 ~ ~-0.30
execute if score @s timer matches 136 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.49 ~ ~-0.15
execute if score @s timer matches 135 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.5 ~ ~
execute if score @s timer matches 134 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.49 ~ ~0.15
execute if score @s timer matches 133 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.47 ~ ~0.30
execute if score @s timer matches 132 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.43 ~ ~0.45
execute if score @s timer matches 131 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.38 ~ ~0.59
execute if score @s timer matches 130 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.32 ~ ~0.72
execute if score @s timer matches 129 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.24 ~ ~0.85
execute if score @s timer matches 128 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.16 ~ ~0.96
execute if score @s timer matches 127 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.06 ~ ~1.06
execute if score @s timer matches 126 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.96 ~ ~1.16
execute if score @s timer matches 125 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.85 ~ ~1.24
execute if score @s timer matches 124 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.72 ~ ~1.32
execute if score @s timer matches 123 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.59 ~ ~1.38
execute if score @s timer matches 122 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.45 ~ ~1.43
execute if score @s timer matches 121 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.30 ~ ~1.47
execute if score @s timer matches 120 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.15 ~ ~1.49
execute if score @s timer matches 119 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~ ~ ~1.5
execute if score @s timer matches 118 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.15 ~ ~1.49
execute if score @s timer matches 117 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.30 ~ ~1.47
execute if score @s timer matches 116 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.45 ~ ~1.43
execute if score @s timer matches 115 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.59 ~ ~1.38
execute if score @s timer matches 114 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.72 ~ ~1.32
execute if score @s timer matches 113 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.85 ~ ~1.24
execute if score @s timer matches 112 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.96 ~ ~1.16
execute if score @s timer matches 111 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.06 ~ ~1.06
execute if score @s timer matches 110 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.16 ~ ~0.96
execute if score @s timer matches 109 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.24 ~ ~0.85
execute if score @s timer matches 108 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.32 ~ ~0.72
execute if score @s timer matches 107 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.38 ~ ~0.59
execute if score @s timer matches 106 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.43 ~ ~0.45
execute if score @s timer matches 105 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.47 ~ ~0.30
execute if score @s timer matches 104 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.49 ~ ~0.15
execute if score @s timer matches 103 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.5 ~ ~
execute if score @s timer matches 102 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.49 ~ ~-0.15
execute if score @s timer matches 101 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.47 ~ ~-0.30
execute if score @s timer matches 100 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.43 ~ ~-0.45
execute if score @s timer matches 99 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.38 ~ ~-0.59
execute if score @s timer matches 98 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.32 ~ ~-0.72
execute if score @s timer matches 97 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.24 ~ ~-0.85
execute if score @s timer matches 96 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.16 ~ ~-0.96
execute if score @s timer matches 95 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.06 ~ ~-1.06
execute if score @s timer matches 94 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.96 ~ ~-1.16
execute if score @s timer matches 93 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.85 ~ ~-1.24
execute if score @s timer matches 92 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.72 ~ ~-1.32
execute if score @s timer matches 91 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.59 ~ ~-1.38
execute if score @s timer matches 90 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.45 ~ ~-1.43
execute if score @s timer matches 89 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.30 ~ ~-1.47
execute if score @s timer matches 88 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.15 ~ ~-1.49
execute if score @s timer matches 87 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~ ~ ~-1.5
execute if score @s timer matches 86 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.15 ~ ~-1.49
execute if score @s timer matches 85 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.30 ~ ~-1.47
execute if score @s timer matches 84 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.45 ~ ~-1.43
execute if score @s timer matches 83 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.59 ~ ~-1.38
execute if score @s timer matches 82 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.72 ~ ~-1.32
execute if score @s timer matches 81 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.85 ~ ~-1.24
execute if score @s timer matches 80 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.96 ~ ~-1.16
execute if score @s timer matches 79 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.06 ~ ~-1.06
execute if score @s timer matches 78 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.16 ~ ~-0.96
execute if score @s timer matches 77 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.24 ~ ~-0.85
execute if score @s timer matches 76 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.32 ~ ~-0.72
execute if score @s timer matches 75 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.38 ~ ~-0.59
execute if score @s timer matches 74 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.43 ~ ~-0.45
execute if score @s timer matches 73 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.47 ~ ~-0.30
execute if score @s timer matches 72 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.49 ~ ~-0.15
execute if score @s timer matches 71 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.5 ~ ~
execute if score @s timer matches 70 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.49 ~ ~0.15
execute if score @s timer matches 69 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.47 ~ ~0.30
execute if score @s timer matches 68 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.43 ~ ~0.45
execute if score @s timer matches 67 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.38 ~ ~0.59
execute if score @s timer matches 66 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.32 ~ ~0.72
execute if score @s timer matches 65 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.24 ~ ~0.85
execute if score @s timer matches 64 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.16 ~ ~0.96
execute if score @s timer matches 63 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.06 ~ ~1.06
execute if score @s timer matches 62 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.96 ~ ~1.16
execute if score @s timer matches 61 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.85 ~ ~1.24
execute if score @s timer matches 60 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.72 ~ ~1.32
execute if score @s timer matches 59 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.59 ~ ~1.38
execute if score @s timer matches 58 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.45 ~ ~1.43
execute if score @s timer matches 57 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.30 ~ ~1.47
execute if score @s timer matches 56 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.15 ~ ~1.49
execute if score @s timer matches 55 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~ ~ ~1.5
execute if score @s timer matches 54 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.15 ~ ~1.49
execute if score @s timer matches 53 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.30 ~ ~1.47
execute if score @s timer matches 52 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.45 ~ ~1.43
execute if score @s timer matches 51 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.59 ~ ~1.38
execute if score @s timer matches 50 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.72 ~ ~1.32
execute if score @s timer matches 49 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.85 ~ ~1.24
execute if score @s timer matches 48 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.96 ~ ~1.16
execute if score @s timer matches 47 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.06 ~ ~1.06
execute if score @s timer matches 46 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.16 ~ ~0.96
execute if score @s timer matches 45 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.24 ~ ~0.85
execute if score @s timer matches 44 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.32 ~ ~0.72
execute if score @s timer matches 43 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.38 ~ ~0.59
execute if score @s timer matches 42 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.43 ~ ~0.45
execute if score @s timer matches 41 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.47 ~ ~0.30
execute if score @s timer matches 40 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.49 ~ ~0.15
execute if score @s timer matches 39 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.5 ~ ~
execute if score @s timer matches 38 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.49 ~ ~-0.15
execute if score @s timer matches 37 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.47 ~ ~-0.30
execute if score @s timer matches 36 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.43 ~ ~-0.45
execute if score @s timer matches 35 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.38 ~ ~-0.59
execute if score @s timer matches 34 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.32 ~ ~-0.72
execute if score @s timer matches 33 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.24 ~ ~-0.85
execute if score @s timer matches 32 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.16 ~ ~-0.96
execute if score @s timer matches 31 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-1.06 ~ ~-1.06
execute if score @s timer matches 30 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.96 ~ ~-1.16
execute if score @s timer matches 29 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.85 ~ ~-1.24
execute if score @s timer matches 28 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.72 ~ ~-1.32
execute if score @s timer matches 27 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.59 ~ ~-1.38
execute if score @s timer matches 26 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.45 ~ ~-1.43
execute if score @s timer matches 25 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.30 ~ ~-1.47
execute if score @s timer matches 24 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~-0.15 ~ ~-1.49
execute if score @s timer matches 23 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~ ~ ~-1.5
execute if score @s timer matches 22 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.15 ~ ~-1.49
execute if score @s timer matches 21 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.30 ~ ~-1.47
execute if score @s timer matches 20 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.45 ~ ~-1.43
execute if score @s timer matches 19 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.59 ~ ~-1.38
execute if score @s timer matches 18 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.72 ~ ~-1.32
execute if score @s timer matches 17 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.85 ~ ~-1.24
execute if score @s timer matches 16 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~0.96 ~ ~-1.16
execute if score @s timer matches 15 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.06 ~ ~-1.06
execute if score @s timer matches 14 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.16 ~ ~-0.96
execute if score @s timer matches 13 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.24 ~ ~-0.85
execute if score @s timer matches 12 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.32 ~ ~-0.72
execute if score @s timer matches 11 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.38 ~ ~-0.59
execute if score @s timer matches 10 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.43 ~ ~-0.45
execute if score @s timer matches 9 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.47 ~ ~-0.30
execute if score @s timer matches 8 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.49 ~ ~-0.15
execute if score @s timer matches 1..7 at @e[type=marker,tag=breeze_center,limit=1,sort=nearest] run tp @s ~1.5 ~ ~

# Teleport to void and kill breeze after 10 seconds (200 ticks)
execute if score @s timer matches ..0 run kill @e[type=marker,tag=breeze_center,limit=1,sort=nearest]
execute if score @s timer matches ..0 run tp @s ~ ~-1000 ~
execute if score @s timer matches ..0 run kill @s

# Join the no_friendly_fire_team (only once)
execute unless entity @s[team=no_friendly_fire_team] run team join no_friendly_fire_team @s

# Invulnerable, NoAI, Silent already set in summon NBT (maps/der_eisendrache/quest/bows/electric/summon.mcfunction)

# Make breeze invisible (reapply every tick for 2 seconds to keep it persistent)
effect give @s invisibility 2 0 true

# Kill any old area effect clouds (only check every 100 ticks)
execute if score #tick tick matches 0 run kill @e[type=area_effect_cloud,tag=breeze_wind,distance=..1]

# Create flat cloud effect in a large radius around the breeze at ground level (always on)
particle minecraft:cloud ~ ~0.1 ~ 5 0.1 5 0 10 normal

# Add random yellow flashes and sparks around the breeze (with Y variation)
# Electric sparks every 2 ticks
execute if score #tick tick matches 0..1 run particle minecraft:electric_spark ~ ~1 ~ 5 5 5 0.2 3 normal
execute if score #tick tick matches 2..3 run particle minecraft:electric_spark ~ ~1 ~ 5 5 5 0.2 3 normal

# Yellow dust particles every tick (always on for glow effect)
particle minecraft:dust{color:[1.0,1.0,0.0],scale:1.5} ~ ~1 ~ 5 5 5 0 3 normal

# Bright electric white-yellow flash occasionally (every 20 ticks for dramatic effect)
execute if score #tick tick matches 0 run particle minecraft:flash{color:[1.0,1.0,0.8,1.0]} ~ ~1 ~ 5 5 5 0 1 normal
execute if score #tick tick matches 50 run particle minecraft:flash{color:[1.0,1.0,0.8,1.0]} ~ ~1 ~ 5 5 5 0 1 normal

# Apply slowness and damage to nearby zombified piglins
execute as @e[type=zombified_piglin,tag=!immune_elements,distance=..10] run effect give @s slowness 1 2 true
execute as @e[type=zombified_piglin,tag=!immune_elements,distance=..10] run damage @s 1 lightning_bolt

# Apply levitation in cycles: 20 ticks on, 20 ticks off (using breeze timer)
# Timer counts down from 200, so check for patterns: 180-199, 140-159, etc.
execute if score @s timer matches 180..199 as @e[type=zombified_piglin,tag=!immune_elements,distance=..10] run effect give @s levitation 1 1 true
execute if score @s timer matches 160..179 as @e[type=zombified_piglin,distance=..10] run effect clear @s levitation
execute if score @s timer matches 140..159 as @e[type=zombified_piglin,tag=!immune_elements,distance=..10] run effect give @s levitation 1 1 true
execute if score @s timer matches 120..139 as @e[type=zombified_piglin,distance=..10] run effect clear @s levitation
execute if score @s timer matches 100..119 as @e[type=zombified_piglin,tag=!immune_elements,distance=..10] run effect give @s levitation 1 1 true
execute if score @s timer matches 80..99 as @e[type=zombified_piglin,distance=..10] run effect clear @s levitation
execute if score @s timer matches 60..79 as @e[type=zombified_piglin,tag=!immune_elements,distance=..10] run effect give @s levitation 1 1 true
execute if score @s timer matches 40..59 as @e[type=zombified_piglin,distance=..10] run effect clear @s levitation
execute if score @s timer matches 20..39 as @e[type=zombified_piglin,tag=!immune_elements,distance=..10] run effect give @s levitation 1 1 true
execute if score @s timer matches 0..19 as @e[type=zombified_piglin,distance=..10] run effect clear @s levitation

# Randomly summon lightning at nearby zombified piglins (every 40 ticks)
execute if score #tick tick matches 0 if entity @e[type=zombified_piglin,tag=!immune_elements,distance=..20,limit=1,sort=random] at @e[type=zombified_piglin,tag=!immune_elements,distance=..20,limit=1,sort=random] run function zbk_der_eisendrache:quest/bows/electric/effects/lightning
execute if score #tick tick matches 40 if entity @e[type=zombified_piglin,tag=!immune_elements,distance=..20,limit=1,sort=random] at @e[type=zombified_piglin,tag=!immune_elements,distance=..20,limit=1,sort=random] run function zbk_der_eisendrache:quest/bows/electric/effects/lightning
