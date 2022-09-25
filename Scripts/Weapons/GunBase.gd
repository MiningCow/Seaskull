extends "res://Scripts/Weapons/WeaponBase.gd"

onready var projectile_start = $WeaponPivot/ProjectileStart

export(PackedScene) var projectile
export(float) var spread

func attack():
	sound.pitch_scale = rng.randf_range(0.9, 1.1)
	sound.play()

	var new_projectile = projectile.instance()

	var direction = global_position.direction_to(get_viewport().get_mouse_position())
	if spread: direction = direction.rotated(rng.randf_range(-spread, spread))

	new_projectile.initiate(direction, projectile_start.global_position) #add speed

	player.get_parent().add_child(new_projectile)
	.attack()
