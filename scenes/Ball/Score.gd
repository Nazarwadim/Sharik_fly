extends Node
@export var ball:Ball

func save():
	var save_dict ={ "high_score": ball.high_score }
	return save_dict

func save_score() -> void:
	var save_game_ = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var player = ball
	
	if player.scene_file_path.is_empty():
		print("persistent node '%s' is not an instanced scene, skipped" % player.name)
		return

	if !player.has_method("save"):
		print("persistent node '%s' is missing a save() function, skipped" % player.name)
		return

	var node_data = player.call("save")
	var json_string = JSON.stringify(node_data)
	save_game_.store_line(json_string)

func load_score():
	if not FileAccess.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.

	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		var node_data = json.get_data()
		
		ball.high_score = node_data["high_score"]

func _process(delta) -> void:
	if ball.high_score < ball.position.x:
		ball.high_score = ball.position.x
