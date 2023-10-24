extends State

func kaktus_entered(area2D) -> void:
	if area2D is Kaktus:
		interrupt_state.emit(self)

func on_enter() -> void:
	animation.play("die")
	animation.animation_looped.connect(die_anim_finished)

func die_anim_finished() -> void:
	ball.sound_controler.play_sound("LopnuvSound", randf_range(0.8, 1.2), 0)
	animation.animation_looped.disconnect(self.die_anim_finished)
	ball.hide()
	ball.phisics.velocity = Vector2.ZERO
	ball.phisics.speed = 0
	SignalBus.player_died.emit(ball)


