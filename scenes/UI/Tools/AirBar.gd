extends ProgressBar


func _on_value_changed(value):
	if value < 30:
		modulate = Color(1/value, 0.094 , value/30 )
	else:
		modulate = Color(0.325, 0.094, 1)

