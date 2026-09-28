# Tram 1 Easter Egg

This map-owned subsystem gives each player one hidden Tram 1 call per Der Eisendrache game without spawning detector entities.

Each hand-thrown grenade reports its five physics sub-step positions through the central `maps/events/grenade_step` dispatcher. As soon as the game becomes active, `detection/check_grenade` uses the existing idle Tram 1 root as a moving detector and tests the grenade against a root-relative `9 x 5 x 5` block box. This includes the rocket-launch and pre-Round 1 window. Detection follows Tram 1 through its delayed auto-departure and movement toward Middle, then stops when it arrives. Grenade-launcher projectiles do not qualify. Qualification and physical collision are separate: entering the interior records the thrower, while the tram module's display-shaped shell detonates the grenade only when it reaches an approximated visible surface.

The grenade's recorded `thrower_id` grants only that player `tram_ee_ready`. Successful console calls then increment that player's `tram_ee_calls`; rejected calls do not count. On the fifth successful call, the Fuse is consumed, `tram_ee_used` permanently locks that player's reward for the current game, and the normal Tram 2 call is replaced by an 18-tick (0.9-second) sequence that alternates both console lamps between emerald and black before calling Tram 1.

`management/reset` clears online and offline scoreboard holders when a new Der Eisendrache game begins. This makes qualification, call progress, and one-time completion independent for every player and repeatable in a later game.

Qualification and fifth-call activation chat notices are visible only to the triggering player tagged `debug`. The lamp sequence, sounds, qualification and rewards remain active for all eligible players.
