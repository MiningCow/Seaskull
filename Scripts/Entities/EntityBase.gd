extends Sprite

onready var stats = $Stats
var movement: Vector2

func _physics_process(delta):
	main(delta)
	if movement: move()

func main(delta):
	pass
	

func move():
	position += movement
