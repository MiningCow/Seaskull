extends Position2D

onready var timer = $Timer
onready var sound = $Sound
onready var attack_start = $AttackStart

export(PackedScene) var attack
export(int) var damage
export(float) var cooldown
export(float) var spread

var shooting: bool
var can_shoot: bool = true
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	timer.wait_time = cooldown
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
	sound.pitch_scale = rng.randf_range(0.9, 1.1)
	sound.play()
#	create bullet
	var new_attack = attack.instance()
#	set props
	var direction = global_position.direction_to(get_viewport().get_mouse_position())
	if spread: direction = direction.rotated(rng.randf_range(-spread, spread))
	new_attack.direction = direction
	new_attack.position = attack_start.global_position
	new_attack.damage += damage
	$Attacks.add_child(new_attack)
#	cooldown
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

#todo: base entity, state machine, effects
