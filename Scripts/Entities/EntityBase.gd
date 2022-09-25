extends Area2D

class_name Entity

onready var stats = $Stats
onready var health: int = stats.max_health setget set_health
var movement: Vector2

func _physics_process(delta):
	physics_process(delta)
	if movement: move()

func physics_process(delta):
	pass

func move():
	position += movement
	movement = Vector2.ZERO

func set_health(value):
	if value != health:
		health = clamp(value, 0, stats.max_health)
	else: health = 0

func take_damage(damage):
	self.health -= damage
	if health == 0:
		die()

func die():
	queue_free()

func _on_Hurtbox_area_entered(attack):
#	print(attack.damage)
	take_damage(attack.damage)
	print(health)
