extends State


func kaktus_entered(area2D) -> void:
	if area2D is Kaktus:
		ball.area_entered.disconnect(kaktus_entered)
		interrupt_state.emit(self)

func on_enter() -> void:
	animation.play("die")
	animation.animation_looped.connect(_die_anim_finished)
	ball.sound_controler.play_sound("LopnuvSound", randf_range(0.8, 1.2), 0)

func _die_anim_finished() -> void:	
	ball.hide()
	ball.area_entered.connect(kaktus_entered)
	ball.phisics.velocity = Vector2.ZERO
	ball.phisics.speed = 0
	SignalBus.player_died.emit(ball)
	animation.animation_looped.disconnect(_die_anim_finished)


