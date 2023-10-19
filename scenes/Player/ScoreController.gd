extends Node
@export var ball:Player

func _physics_process(delta) -> void:
	if ball.high_score < ball.position.x:
		ball.high_score = ball.position.x
