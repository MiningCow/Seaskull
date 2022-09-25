extends "res://Scripts/StateMachine/State.gd"

export(Vector2) var direction

onready var stats = owner.get_node("Stats")

func update(delta):
	owner.movement = direction * stats.speed * delta
	owner.rotation = direction.angle()
