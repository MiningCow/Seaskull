extends "res://Scripts/Attacks/AttackBase.gd"

export(int) var speed

func _process(delta):
	position += direction * speed * delta
