extends Node

var block_airpresure_up:bool = false
@export var ball:Player

func _physics_process(delta) -> void:	
	if ball.air_presure < 0:
		block_airpresure_up = true
	if ball.air_presure > 50:
		block_airpresure_up = false
	
func _process(delta) -> void:
	if ball.current_state == ball.state.idle:
		ball.air_presure = move_toward(ball.air_presure, 100, ball.air_presure_restoration * delta)
	
	if ball.current_state == ball.state.down:
		ball.air_presure = move_toward( ball.air_presure, 100, ball.air_presure_restoration_while_down * delta)
	
	if ball.current_state == ball.state.up:
		ball.air_presure -= ball.air_presure_decrease_decrease * delta
