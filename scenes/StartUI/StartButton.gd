extends Control



func _on_gui_input(event):
	if event is InputEventMouseButton or event is InputEventScreenTouch:
		SignalBus.on_start_button_preased.emit()
