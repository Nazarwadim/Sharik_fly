extends Node
var highest_score:float
func _save():
	var save_dict ={ "high_score": highest_score }
	return save_dict

func _save_score() -> void:
	var save_game_ = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var node_data = _save()
	var json_string = JSON.stringify(node_data)
	save_game_.store_line(json_string)

func _load_score():
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
		
		highest_score = node_data["high_score"]

func update_highest_score(ball_position) -> void:
	SignalBus.on_score_changed.emit(self, ball_position.x)
	SignalBus.on_highest_score_changed.emit(self, highest_score)
	if highest_score < ball_position.x:
		highest_score = ball_position.x
