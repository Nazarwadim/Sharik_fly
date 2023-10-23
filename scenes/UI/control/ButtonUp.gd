extends TouchScreenButton

func _on_button_down():
	Input.action_press("up")

func _on_button_up():
	Input.action_release("up")
