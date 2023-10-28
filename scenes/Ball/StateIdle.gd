extends State
@export var state_down:State
@export var state_up:State
@export var state_die:State
func on_enter():
	animation.play("idle")
	_play_sound()
	

func state_process(delta):
	ball.phisics.velocity.x = ball.phisics.speed
	ball.phisics.velocity.y = 0
	ball.position.y = move_toward(ball.position.y, ball.move_toward_y + 200, 0.3 * ball.phisics.velocity.x * delta)
	ball.air_presure.move_in_state_idle(ball.air_presure_restoration, delta)
	
	
	_input_()


func _input_():
	if Input.is_action_pressed("down"):
		next_state = state_down
	elif Input.is_action_pressed("up") && not ball.air_presure.block_airpresure_up:
		next_state = state_up

func _play_sound():
	var length = ball.sound_controler.get_sound_length("DownSound")
	var pitch_scale:float =abs( length / (100 / ball.air_presure_restoration) )
	ball.sound_controler.play_sound("DownSound",pitch_scale, abs( length * ball.air_presure.value/100 - 0.01 ))
	
