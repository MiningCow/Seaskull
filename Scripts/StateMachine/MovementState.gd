extends "res://Scripts/StateMachine/State.gd"

export(Vector2) var target
export(Vector2) var direction

onready var stats = owner.get_node("Stats")

var reached_target: bool = false

func enter(previous_state):
	direction = owner.position.direction_to(target)

func update(delta):
	if !reached_target:
		var position = owner.position
		var speed = stats.speed
		var distance_to_target = position.distance_to(target)
		direction = owner.position.direction_to(target)

		if distance_to_target < speed * delta:
			move(direction, distance_to_target)
			reached_target = true
		else:
			move(direction, speed * delta)

func move(move_direction, move_speed):
	owner.movement = move_direction * move_speed
	owner.rotation = direction.angle()

# if distance_from_start < distance_to_move:
