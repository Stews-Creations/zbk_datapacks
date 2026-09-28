# Keep the vanilla XP display empty; the actionbar owns the round counter.
execute store result score #hud_xp temp run experience query @s levels
execute if score #hud_xp temp matches 1.. run experience set @s 0 levels
execute store result score #hud_xp temp run experience query @s points
execute if score #hud_xp temp matches 1.. run experience set @s 0 points
