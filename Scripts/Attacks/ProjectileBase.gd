extends Sprite

export(int) var speed
export(int) var damage setget set_damage
var direction: Vector2

func _ready():
	rotation = direction.angle()
	$Timer.connect("timeout", self, "queue_free")
	$Hitbox.damage = damage

func initiate(direction, location):
	self.direction = direction
	global_position = location

func set_damage(value):
	damage = value
	$Hitbox.damage = value

func _physics_process(delta):
	position += direction * speed * delta

func _on_Hitbox_area_entered(area):
	queue_free()
