extends "res://Scripts/StateMachine/MovementState.gd"

export(float) var distance

func enter(previous_state):
	target = direction * distance
	.enter(previous_state)
