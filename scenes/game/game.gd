extends Node
class_name Game

func _ready():
	randomize()

func _physics_process(delta) -> void:
	var value = $Player.air_presure
	$UI.set_presure_value( value )

func restart(continue_to_play:bool = false):
	$Player.restart(continue_to_play)
	$Player.position = $StartPosition.position
	get_tree().call_group("kaktuses", "queue_free")
	get_tree().call_group("clouds", "queue_free")

func save_game() -> void:
	var save_game_ = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var player = $Player
	
	if player.scene_file_path.is_empty():
		print("persistent node '%s' is not an instanced scene, skipped" % player.name)
		return

	if !player.has_method("save"):
		print("persistent node '%s' is missing a save() function, skipped" % player.name)
		return

	var node_data = player.call("save")
	var json_string = JSON.stringify(node_data)
	save_game_.store_line(json_string)

func load_game():
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
		
		$Player.high_score = node_data["high_score"]
		
		

func _on_tree_exiting():
	save_game()


func _on_tree_entered():
	load_game()


func _on_ui_restart_button_clicked():
	restart()
