extends TextureButton

func _ready():
	pressed.connect(_preased_restart_button)
	
func _preased_restart_button():
	SignalBus.on_restart_button_preased.emit()
	SignalBus.on_start_button_preased.emit()
