extends Sprite

export(int) var speed = 1000
export(int) var strength
var health: int
var movement: Vector2

func _physics_process(delta):
	main(delta)
	if movement: move()

func main(delta):
	pass

func move():
	position += movement
