extends Entity

class_name Enemy

export(PackedScene) var damage_effect
onready var state_machine = $StateMachine

func physics_process(delta):
	state_machine.update(delta)

func _on_Hurtbox_area_entered(attack):
	var effect = damage_effect.instance()
	effect.position = (attack.global_position - position).rotated(-rotation)
	effect.rotation = attack.global_rotation - rotation
	add_child(effect)
	._on_Hurtbox_area_entered(attack)

# /root/World/YSort/Fries
