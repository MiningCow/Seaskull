extends Position2D

onready var sprite = $Sprite
onready var timer = $Timer
onready var sound = $Sound

var bullet = preload("res://Scenes/Bullet.tscn")
var shooting: bool
var can_shoot: bool = true

func _ready():
	owner.connect("player_moved", self, "_on_Player_move")
	look_at(get_viewport().get_mouse_position())

func _input(event):
	if event is InputEventMouseMotion:
		look_at_mouse()
	if event is InputEventMouseButton && event.button_index == 1:
		shooting = event.pressed

func _process(delta):
	if shooting && can_shoot: shoot()

func shoot():
	sound.play()
	var direction = global_position.direction_to(get_viewport().get_mouse_position())
	var new_bullet = bullet.instance()
	new_bullet.direction = direction
	new_bullet.position = global_position + direction * 50
	$Projectiles.add_child(new_bullet)
	can_shoot = false
	timer.start()

func _on_Timer_timeout():
	can_shoot = true

func look_at_mouse():
	var mouse = get_viewport().get_mouse_position()

	if mouse.x > global_position.x:
		scale.y = 1
	else:
		scale.y = -1
	look_at(mouse)

func _on_Player_move():
	look_at_mouse()
