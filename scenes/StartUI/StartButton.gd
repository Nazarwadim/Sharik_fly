extends Control



func _on_gui_input(event):
	if event is InputEventMouseButton:
		SignalBus.on_start_button_preased.emit()
		get_parent().gravity_scale = 1
