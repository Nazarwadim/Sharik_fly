extends Button

func _on_button_down():
	Input.action_press("down")

func _on_button_up():
	Input.action_release("down")
