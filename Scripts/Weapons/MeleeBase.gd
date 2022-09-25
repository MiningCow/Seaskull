extends "res://Scripts/Weapons/WeaponBase.gd"

onready var animation = $AnimationPlayer

func attack():
	can_attack = false
	do_look_at_mouse = false
	sound.play()
	animation.play("attack")

func _on_AnimationPlayer_animation_finished(anim_name):
	do_look_at_mouse = true
	look_at_mouse()
	timer.start()
