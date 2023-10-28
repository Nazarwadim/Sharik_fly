extends State

@export var state_down:State
@export var state_idle:State
@export var state_die:State
func on_enter():
	ball.trail.trail_enabled = false
	_play_sound()
	animation.play("up")
	
func state_process(delta):
	ball.phisics.velocity.y = -0.5 * ball.phisics.velocity.x
	ball.air_presure.move_in_state_up(ball.air_presure_decrease,delta)	
	_input_()

func _input_():
	if Input.is_action_pressed("up") && not ball.air_presure.block_airpresure_up:
		return
	elif Input.is_action_pressed("down"):
		next_state = state_down
	else:
		next_state = state_idle
		
func on_exit():
	ball.trail.trail_enabled = true
		
func _play_sound():
	var length = ball.sound_controler.get_sound_length("UpSound")
	var pitch_scale:float =abs( length / (100 / ball.air_presure_decrease) )
	ball.sound_controler.play_sound("UpSound",pitch_scale, abs( length * (100 - ball.air_presure.value)/100 - 0.01 ))
