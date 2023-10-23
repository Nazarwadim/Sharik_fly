extends Sprite2D



func _on_visible_on_screen_notifier_2d_screen_exited():
	await get_tree().create_timer(16).timeout
	queue_free()
