extends Button

func _on_pressed():
	SignalBus.on_start_button_preased.emit()
	get_parent().gravity_scale = 1
