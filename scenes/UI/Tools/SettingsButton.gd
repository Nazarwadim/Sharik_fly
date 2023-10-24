extends TextureButton


func _on_button_down():
	var tween = get_tree().create_tween()
	
	tween.tween_property(self, "size", Vector2(70,70), 0.2)
	tween.tween_property(self, "position", Vector2(1080,1),0.2)
	
	tween.play()


func _on_button_up():
	var tween = get_tree().create_tween()
	
	tween.tween_property(self, "size", Vector2(60,60),0.2)
	tween.tween_property(self, "position", Vector2(1090,1),0.2)
	tween.play()
