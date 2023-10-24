extends State

func kaktus_entered(area2D) -> void:
	if area2D is Kaktus:
		interrupt_state.emit(self)

func on_enter() -> void:
	animation.play("die")
	animation.animation_looped.connect(die_anim_finished)

func die_anim_finished() -> void:
	animation.animation_looped.disconnect(die_anim_finished)
	ball.hide()
	SignalBus.player_died.emit(ball)


