extends "res://Scripts/StateMachine/GoToState.gd"

func enter(previous_state):
	target = get_tree().get_root().get_node("World/YSort/Fries")
	print(get_tree().get_root().get_node("World/YSort/Fries").get_path())
