extends Sprite

signal player_moved
#signal player_moved(direction)

export(int) var speed = 10
var movement: int = 0

func _ready():
	pass

func _physics_process(delta):
	movement = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) * speed * delta

	if movement:
		emit_signal("player_moved")
#		emit_signal("player_moved", "left" if movement < 0 else "right")
		position.x += movement

	movement = 0
