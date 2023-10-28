extends TextureButton

func _on_toggled(button_pressed:bool):
	SignalBus.on_pause_button_preased.emit(button_pressed)
	var tween = get_tree().create_tween()	
	if button_pressed:
		tween.tween_property(self, "size", Vector2(85,85), 0.2)
		tween.tween_property(self, "position", Vector2(1170,20),0.2)
		
	else:
		tween.tween_property(self, "size", Vector2(64,64),0.2)
		tween.tween_property(self, "position", Vector2(1190,20),0.2)
		
	tween.play()

func _ready():
	SignalBus.on_restart_button_preased.connect(_toggle)
	
func _toggle():
	button_pressed = !button_pressed
	
