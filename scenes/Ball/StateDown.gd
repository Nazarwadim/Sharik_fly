extends State
@export var state_idle:State
@export var state_up:State
@export var state_die:State
func on_enter():
	animation.play("down")
	_play_sound()
	
func state_process(delta) -> void:
	ball.phisics.velocity.y = 0.5 * ball.phisics.velocity.x 
	ball.air_presure.move_in_state_down(ball.air_presure_restoration_while_down, delta)
	
	_input_()

func _input_():
	if Input.is_action_pressed("down"):
		return
	elif Input.is_action_pressed("up") && not ball.air_presure.block_airpresure_up:
		next_state = state_up
	else:
		next_state = state_idle

func _play_sound():
	var length = ball.sound_controler.get_sound_length("DownSound")
	var pitch_scale:float =abs( length / (100 / ball.air_presure_restoration_while_down) )
	ball.sound_controler.play_sound("DownSound",pitch_scale, abs( length * ball.air_presure.value/100 - 0.1 ))
