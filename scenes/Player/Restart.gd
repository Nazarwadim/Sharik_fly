extends Node
var player:Player

func _ready():
	player = get_parent()

func sharic_restart(continue_to_play:bool = false) -> void:  
	player.change_state( -1 )
	player.process_mode = Node.PROCESS_MODE_INHERIT
	player.visible = true
	player.on_restart.emit()
	continue_() if continue_to_play else restart()

func restart():
	player.air_presure = 20
	player.speed = player.start_speed
	player.speed_increase = player.start_speed_increase

func continue_():
	var tween = get_tree().create_tween()
	# In development...
	pass
