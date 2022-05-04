extends Sprite

export(int) var damage
export(Vector2) var direction = Vector2.ZERO

func _ready():
	rotation = direction.angle()

func die():
	queue_free()
