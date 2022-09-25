extends "res://Scripts/StateMachine/StateMachine.gd"

onready var pursue = $PursueFries
onready var flee = $Flee

func state_logic():
	match current_state:
		pursue:
			if pursue.reached_target:
				owner.has_fry = true
				owner.sprite.animation = "flap"
				set_state(flee)
