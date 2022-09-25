extends "res://Scripts/Entities/EntityBase.gd"

#signal player_moved(direction)
var holding_fries = false

func _ready():
	$Weapon.player = self

func physics_process(delta):
	movement.x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) * stats.speed * delta

	if Input.is_action_just_pressed("interact"):
		holding_fries = !holding_fries
		$RemoteTransform2D.remote_path = "/root/World/YSort/Fries" if holding_fries else ""
	if Input.is_action_pressed("shoot"):
		$Weapon.try_attack()

func move():
	$Weapon.look_at_mouse()
	.move()

func die():
	print("You died!")
