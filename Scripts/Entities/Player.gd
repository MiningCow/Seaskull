extends "res://Scripts/Entities/EntityBase.gd"

signal player_moved
#signal player_moved(direction)

func main(delta):
	movement.x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) * speed * delta

func move():
	emit_signal("player_moved")
	.move()
