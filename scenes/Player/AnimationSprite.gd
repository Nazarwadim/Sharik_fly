extends AnimatedSprite2D

@export var ball:Player
func _ready() -> void:
	play("idle")

func _on_player_on_state_changed(state) -> void:
	if state == ball.state.idle:
		play("idle")
	elif state == ball.state.up:
		play("up")
	elif state == ball.state.down:
		play("down")
	elif state == ball.state.die:
		play("die")
