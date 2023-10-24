extends State
@export var state_idle:State
func on_enter():
	animation.play("idle")
	SignalBus.on_start_button_preased.connect(on_exit)

func on_exit():
	ball.air_presure.value = ball.start_air_presure
	ball.phisics.speed = ball.start_speed
	ball.phisics.speed_increase = ball.start_speed_increase
	next_state = state_idle
