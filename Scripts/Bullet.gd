extends Area2D

export(int) var speed
export(Vector2) var direction = Vector2.ZERO

func _ready():
	$Sprite.rotation = direction.angle()

func _process(delta):
	position += direction * speed * delta

func die():
	queue_free()
