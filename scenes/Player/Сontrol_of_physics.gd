extends Node
@export var ball:Player

func _physics_process(delta) -> void:
	ball.speed += ball.speed_increase * delta
	
	if ball.current_state == ball.state.idle:
		ball.velocity.x = ball.speed
		ball.velocity.y = 0
		ball.position.y = move_toward(ball.position.y, ball.move_toward_y, 0.3 * ball.velocity.x * delta)
		
	elif ball.current_state == ball.state.down:
		ball.velocity.y = 0.5 * ball.velocity.x 
		
		
	elif ball.current_state == ball.state.up:
		ball.velocity.y = -0.5 * ball.velocity.x
	
	ball.position.y = clampf(ball.position.y, -1000, 0)
	ball.position += ball.velocity * delta 
