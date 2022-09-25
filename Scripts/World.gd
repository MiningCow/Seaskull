extends Node2D
export(PackedScene) var seagull
onready var y_sort = $YSort

func _process(delta):
	if get_tree().get_nodes_in_group("enemies").size() == 0:
		var new_seagull = seagull.instance()
		new_seagull.position = Vector2(50, 50)
		y_sort.add_child(new_seagull)
