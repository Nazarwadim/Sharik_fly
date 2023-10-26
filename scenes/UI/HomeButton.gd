extends Button


func _on_pressed():
	SignalBus.on_restart_button_preased.emit()
	SignalBus.on_startUI_button_preased.emit()
