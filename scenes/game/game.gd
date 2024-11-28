extends Node
class_name Game

@onready var ball:Ball = $Ball

func _ready():
	randomize()
	SignalBus.player_died.connect(player_died)
	SignalBus.on_restart_button_preased.connect(restart)
	SignalBus.on_pause_button_preased.connect(pause)
	
func player_died(ball_):
	ball_.sound_controler.process_mode = Node.PROCESS_MODE_ALWAYS

func restart():
	ball.sound_controler.process_mode = Node.PROCESS_MODE_INHERIT
	get_tree().call_group("kaktuses", "queue_free")
	get_tree().call_group("clouds", "queue_free")
	ball.position = $StartPosition.position
	ball.state_mashine.switch_states(ball.state_mashine.states[0])

func pause(is_preased:bool):
	if is_preased:
		process_mode = Node.PROCESS_MODE_DISABLED
	else:
		process_mode = Node.PROCESS_MODE_INHERIT
	

func _notification(what):
	if (what == NOTIFICATION_APPLICATION_PAUSED or what == NOTIFICATION_WM_GO_BACK_REQUEST) and $UI.visible:
		$UI.setting_button.button_pressed = true
	elif what == NOTIFICATION_WM_GO_BACK_REQUEST and $StartUI.visible:
		$StartUI.exit_button.visible = !$StartUI.exit_button.visible
