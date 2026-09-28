# Anti-gravity wall-run path

Structure void blocks are the persistent authored path. Place each structure void exactly one block below the empty position where temporary barrier collision should appear.

While the room is active, every horizontally moving player tagged `de_ag_inside` and not tagged `de_ag_suppressed` checks a 3-by-2 footprint at floor level: three cells across the player's current row and three cells across the row one block ahead. Nothing behind the player is checked. The scan uses the player's horizontal facing and ignores look pitch. Empty space directly above each structure void becomes a temporary barrier block without showing path particles.

Each temporary barrier block owns a `de_ag_wall_platform` marker. At the start of each tick, every marker loses `de_ag_wall_platform_keep`; scans from all moving eligible players then refresh the exact path cells they find. A refresh sets `de_ag_wall_life` to 3 ticks (0.15 seconds). Missed refreshes count it down, smoothing isolated movement stalls without assigning a block to one player. The barrier changes back to air when the grace reaches zero; deactivation and cleanup still remove all owned blocks immediately.

`de_ag_motion` temporarily reads the player's current horizontal position at 0.01-block precision. `de_ag_wall_x` and `de_ag_wall_z` retain the previous tick's coordinates for comparison. Vertical position is ignored. The first eligible tick counts as moving so the starting row can appear immediately; afterward, `de_ag_wall_moving` is rebuilt whenever X or Z changes by at least 0.01 blocks.

The collision position above each structure void must remain empty. The runtime never replaces authored terrain. Gold left by the immediately previous runtime prototype at a discovered path cell is migrated to a barrier automatically. If a structure void is removed while its barrier is active, the ownership marker still removes that block safely.

After platform updates, the wall-run system checks five points beneath each eligible player's footprint. Only an owned barrier with its authored structure void underneath counts as support. Supported players use normal `0.1` base movement speed for that tick; Stamina Up's faster base speed continues on normal ground and resumes as soon as support ends. The same support result exempts the player from level-2 out-of-bounds recovery.
