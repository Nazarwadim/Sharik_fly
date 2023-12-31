extends State
@export var state_idle:State

func on_enter():
	if ball.phisics != null:
		ball.phisics.speed = 0
		ball.phisics.velocity = Vector2(0,0)
	ball.show()
	animation.play("idle")
	SignalBus.on_start_button_preased.connect(exit)

func exit():
	SignalBus.disconnect("on_start_button_preased",exit)
	ball.air_presure.value = ball.start_air_presure
	ball.phisics.speed = ball.start_speed
	ball.phisics.speed_increase = ball.start_speed_increase
	next_state = state_idle
