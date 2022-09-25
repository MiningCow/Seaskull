extends "res://Scripts/StateMachine/MovementState.gd"

export(float) var reach_threshold
export(NodePath) var target_path = "/root/World/YSort/Fries"

var target_node

func enter(previous_state):
	target_node = get_node(target_path)
	target = target_node.position
	.enter(previous_state)

func update(delta):
	target = target_node.position
	.update(delta)
