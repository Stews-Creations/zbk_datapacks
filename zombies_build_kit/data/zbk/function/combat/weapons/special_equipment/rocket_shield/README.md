# Rocket Shield Prototype

This is a reusable Build Kit Rocket Shield prototype with builder dialog controls. It includes crafting integration, bash damage, and directional melee protection. It has no Map ID requirement.

## Builder controls

Build Kit > Buildables > Shield exposes Give Shield, Refill Shield, Remove Shield, and Give All Shield Parts. The equipped item is named **Rocket Shield**. Give uses the slot-preserving grant below. Refill requires the owned shield in slot 6, restores 3 boosts and full vanilla durability, and preserves its other components. Remove resets ownership, charge and use state, cancels boost movement, clears the back display, and removes tagged shields from the requesting player's inventory. Other players and unrelated shields are unaffected.

```mcfunction
function zbk:combat/weapons/special_equipment/rocket_shield/management/refill
function zbk:combat/weapons/special_equipment/rocket_shield/management/remove
function zbk:map_elements/rocket_shield/management/give_all_parts
```

Give All Shield Parts now calls the [shared part system](../../../../map_elements/rocket_shield/README.md), marks all three collected for the team, and updates the inventory indicators. It does not give physical ingredient stacks or a built shield. Part placement and collection belong to that shared module.

The shield bash, melee finisher, flame effects, charge icons, and held/stowed models support Survival, Creative, and Adventure. Creative uses the same three-charge limit. Entering Spectator cancels an active bash and removes the stowed cosmetic; spectators cannot attack or use equipment. Downed players remain ineligible in every mode. Dog-round pumpkin variants use the same rules.

## Temporary commands

As a Survival-, Creative-, or Adventure-mode player, run:

```mcfunction
function zbk:combat/weapons/special_equipment/rocket_shield/management/give_prototype
```

Owned shields are restored to slot 6 each tick when moved or dropped, preserving `rs_charges` and `rs_durability`. Tagged ground items are deleted by Combat. Restoration preserves displaced items using the inventory helper; if storage is full, it retries when space is available.

The temporary vanilla shield occupies `hotbar.5` (player-facing slot 6). If that slot contains another item, the grant uses the existing inventory-preservation helper and refuses to overwrite it when inventory is full. Monkey Bombs and Trip Mines remain in their tactical slot. While the shield is selected, the player inventory owner hides the gun-tagged offhand display; switching away restores the active gun without changing its ownership or ammo. When the player owns the shield but selects another slot, a cosmetic paper item in `armor.head` renders the full shield through `zbk:special_equipment/rocket_shield/stowed_head`. Its independent head pose places it behind the shoulders. Drawing the shield, downing, reset, or losing the slot-6 shield removes only this cosmetic. Other helmets take priority. During dog rounds the fog pumpkin stays equipped: custom-model-data flag 0 retains its dog-round identity, and flag 1 renders the stowed shield when eligible. Drawing, losing, or removing the shield, or being downed, clears flag 1 while preserving the fog. The normal paper cosmetic returns after the round frees the slot. The dog effect and shield hook share one eligibility check; item components are written only when the variant changes. Chest equipment is untouched. This experimental attachment follows head yaw and pitch rather than the torso; verify placement in-game. It supplies directional rear melee protection while actually equipped.



Select key 6 and hold right-click to trigger a boost. The first active-use event spends one charge; continuing to hold does not spend another until right-click is released and pressed again. The shield retains the right-click use action; Combat owns blocking and durability instead of vanilla shield damage. Inventory and hotbar icons show a white lower-right charge count (3, 2, or 1); zero uses the normal unnumbered `zbk:special_equipment/rocket_shield/shield` icon. Numbered models use `zbk:special_equipment/rocket_shield/shield_3`, `shield_2`, and `shield_1`; all non-GUI contexts render the unchanged shield geometry. Giving or claiming sets icon 3, each successful boost updates it immediately, and refill restores icon 3. Component-only modifiers preserve durability and other item data. This adds no tick checks; existing unnumbered shields update on their next boost or refill. The separate `zbk:special_equipment/rocket_shield/rocket` model is available as an independent model preview:

```mcfunction
function zbk:combat/weapons/special_equipment/rocket_shield/management/give_rocket_part_preview
```

For debugging, the same boost can still be called manually as that player at their position:

```mcfunction
function zbk:combat/weapons/special_equipment/rocket_shield/management/boost_prototype
```

The boost consumes one of three test charges and runs for 12 ticks (0.6 seconds), moving up to 0.6 blocks per tick in two separately collision-checked 0.3-block steps. This is a 50% bash speed increase, reaching at most 7.2 blocks. The second step starts at the updated player position and is skipped if the first is blocked. Six cosmetic flame particles trail each moving tick, visible within 32 blocks. Eight additional owner-only flames spawn 1.3 blocks ahead of the eyes, 0.45 blocks to either side and 0.15 blocks below, following the player's view pitch so they are visible through the first-person viewport. These owner particles use forced delivery; particles add no fire blocks, potion effects, idle tick work, or scheduled cleanup. At each step it tries level movement first, then steps onto snow layers, slabs, or stairs when the landing space is clear. Wool carpets of every color, moss carpet, and pale moss carpet are ignored by boost clearance checks, including the footprint probes, so they do not stop a bash. Snow with 1-7 layers is checked against its collision height at every footprint sample, including mixed-layer edges. Closed floor trapdoors are stepped onto; open vertical trapdoors remain obstacles. Full-height snow stays an obstacle. A step onto a bottom slab briefly rises to the block top, then gravity settles the player by half a block. Before every teleport, nine points across the player's footprint check foot, torso, and head clearance. This conservatively stops the boost at walls, plants, water, fences, and mixed-height corners. Switching away from slot 6, downing, or removing the item cancels the active movement. Full player setup and bleed-out clear this prototype's scores and only its tagged shield item.

During an active bash, a world-aligned 3-block-wide, 2-block-high, 1-block-deep selector box begins 0.1 blocks ahead of the player. The nearest cardinal facing selects its orientation, swapping width and depth for east/west so the contact strip stays shallow. It follows the player before movement and after each successful 0.3-block step; no damage scans run while idle. Live zombified piglins and wave dogs inside it die instantly, including crawlers. Zombified piglins do not require the wave-zombie tag, so ordinary summoned or spawn-egg pigmen can be used for testing. Each kill credits the basher with 100 points (200 during Double Points), one kill stat, powerup drop-gate progress, normal loot; crawler displays are cleaned up. Dead targets are rejected before rewards, so overlapping sweeps cannot award twice. Unrelated mobs, turned allies, combat-ignored, melee-immune, and invulnerable targets are excluded. This volume uses entity hitbox overlap and does not perform a separate line-of-sight raycast.

Left-click uses ordinary shield melee, then finishes the struck wave zombie or dog after verifying that this player caused the hit. The shield adds 8 attack damage to compensate for the shared knife attribute calculation's knife-item offset. The melee finisher does not affect mobs tagged `immune_melee`.

## Protection and durability

The current durability limit is **15 blocked hits**. This is a provisional tuning value based on the [standard Zombie Shield reference](https://nazizombies.fandom.com/wiki/Zombie_Shield); a Rocket Shield-specific weapon asset value was not verified. [BO3's shield script](https://bo3explorer.zeroy.com/__zm__weap__riotshield_8gsc_source.html) supplies the directional reference: held shields cover roughly 78 degrees either side of forward, while stowed shields cover the corresponding rear arc. Side hits pass through. Horizontal facing is used regardless of look pitch.

`rs_durability` is authoritative. Give/claim and operator Refill set 15; initialization/removal sets 0. Each blocked hit consumes one point and updates the native inventory/hotbar durability bar (`max_damage=15`, damage 0-14; vanilla hides the bar at full health). The final hit remains blocked, plays the break sound, and calls `management/remove`, clearing ownership, fuel, the item, and the back cosmetic. A dog-round pumpkin keeps its fog component. The original completed bench remains available for a fresh replacement.

Max Ammo calls `management/refill_charges`: it restores three boosts on an existing owned slot-6 shield, preserving damage and durability, and never grants a missing shield. Operator Refill repairs durability as well. Sounds are `zbk:rocket_shield.impact` on each blocked hit and `zbk:rocket_shield.break` on the final hit.

Protection covers zombified-piglin and wolf melee. It does not currently intercept projectile, flamethrower, persistent burn, fall, explosion, or other environmental damage. Back protection requires the actual head cosmetic or shield-enabled dog-round pumpkin; an unrelated helmet does not provide an invisible shield. Creative can exercise the block/wear logic when targeted; ordinary Creative immunity still applies to exposed damage.

Vanilla damage callbacks cannot cancel a lethal hit. The existing Behavior enemy loops therefore delegate shield-owner melee to Combat before damage. Only enemies targeting a player with an owned slot-6 shield receive a temporary `zbk:shield_melee_router` attack-damage multiplier. Their effective attack damage is saved; base stats and equipment are preserved. A bounded line-of-sight trace gates contact within 1.7 blocks, with a 20-tick (1-second) per-attacker cooldown. Unblocked contact applies the saved damage with native `mob_attack` attribution; blocked contact consumes shield durability. When the target no longer qualifies, the multiplier is removed and vanilla attacks resume. Turned conversion explicitly restores native damage before applying ally stats. This changes melee timing only while targeting a shield owner. No new global enemy selection loop or schedule is added; a single owner-availability check gates routing. Direction probes are temporary markers created and removed synchronously per actual hit, never following entities.

`protection/try_block` is the pre-damage entry point: run as the victim with exactly one attacker tagged `rs_attack_source` in the same dimension; return 1 means the hit was consumed. Callers own adding/removing that transient tag. This function also handles breakage. All behavior is map-independent. Existing shields should be replaced or operator-refilled after installing the component change.

Run the static checks in the repository guide, then exercise protection, durability, movement, and crafting in an isolated Minecraft 26.2 world.

## Ownership

Combat owns per-player state, movement, and the stowed head-slot cosmetic. The shared player hook checks equip state and writes the cosmetic only when missing. There is no back-display teleport or entity-age tick loop. Loaded old back displays are removed on load. The reusable `map_elements/rocket_shield/` owner implements candidate placement, random selection, and shared part collection. The player inventory owner renders that state in `inventory.2` through `inventory.4` on every configured map. The reusable Crafting Bench module owns hold-to-build, the completed bench display, and shield claim eligibility. It calls the same slot-preserving grant for players without a shield. Fuel remains future work.
