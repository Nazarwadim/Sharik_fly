extends TextureButton


func _on_button_down():
	var tween = get_tree().create_tween()
	
	tween.tween_property(self, "size", Vector2(50,50), 0.2)
	tween.tween_property(self, "position", Vector2(1098,1),0.2)
	
	tween.play()


func _on_button_up():
	var tween = get_tree().create_tween()
	
	tween.tween_property(self, "size", Vector2(40,40),0.2)
	tween.tween_property(self, "position", Vector2(1110,1),0.2)
	tween.play()
	
