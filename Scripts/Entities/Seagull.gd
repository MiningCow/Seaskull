extends Enemy

var has_fry: bool = false
onready var sprite = $AnimatedSprite

func _ready():
	$VisibilityNotifier2D.connect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited")

func _on_VisibilityNotifier2D_screen_exited():
	if has_fry:
		print("player damaged")
	die()

func die():
	$VisibilityNotifier2D.disconnect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited")
	.die()
