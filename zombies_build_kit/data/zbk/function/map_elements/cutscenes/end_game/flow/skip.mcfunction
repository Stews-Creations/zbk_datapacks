# ===================================
# END GAME CUTSCENE - SKIP (NO MARKERS)
# ===================================
# Purpose: Immediate game over when cutscene markers don't exist
# Shows title, combat record, then resets
# ===================================

# Remove revive bossbars before game over
execute as @a run function zbk:player/down_system/bossbar/remove_own

# Remove all players from downed team (stops downed particles)
team join no_friendly_fire_team @a

# Display GAME OVER title
title @a times 10 70 20
title @a title {"text":"GAME OVER","color":"dark_red","bold":true}
title @a subtitle ["",{"text":"Rounds Survived ","color":"red"},{"score":{"name":"#global","objective":"wave.round"},"color":"yellow"}]

# Show combat record dialog to all players
execute as @a run function zbk:player/stats/dialog/show

# Teleport all players to worldspawn
execute as @a run function zbk:game/lobby/teleport

# Force all players back to adventure mode
gamemode adventure @a

# Reset the game
function zbk:game/initialize

# Fire game end signals AFTER initialize
function zbk:map_elements/game_signals/runtime/fire_game_end

# Play game over sound
function zbk:game/audio/game_over
