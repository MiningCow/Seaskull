extends Enemy

var has_fry: bool = false
onready var sprite = $AnimatedSprite

func _ready():
	$VisibilityNotifier2D.connect("screen_entered", self, "_on_VisibilityNotifier2D_screen_exited")

func _on_VisibilityNotifier2D_screen_exited():
	print("Triggered")
#	if has_fry:
#		print("player damaged")
#	die()

func die():
	$VisibilityNotifier2D.disconnect("screen_entered", self, "_on_VisibilityNotifier2D_screen_exited")
	print(str(self.is_connected("screen_entered", self, "_on_VisibilityNotifier2D_screen_exited")) + " Connected")
	.die()
