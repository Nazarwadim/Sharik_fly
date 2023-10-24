extends Node
class_name Game

func _ready():
	randomize()



func restart(continue_to_play:bool = false):
	$Player.restart(continue_to_play)
	$Player.position = $StartPosition.position
	get_tree().call_group("kaktuses", "queue_free")
	get_tree().call_group("clouds", "queue_free")



func _on_ui_restart_button_clicked():
	restart()
