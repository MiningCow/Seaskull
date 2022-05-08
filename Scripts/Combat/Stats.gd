extends Node

export(int) var speed
export(int) var strength
export(int) var max_health

var health: int = max_health setget set_health

func _ready():
	pass

func set_health(value):
	if value != health:
		health = clamp(health, 0, max_health)
	else: health = 0

func _on_Hurtbox_area_entered(area):
	pass # Replace with function body.
