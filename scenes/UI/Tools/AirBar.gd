extends ProgressBar

func _ready():
	SignalBus.on_airpresure_changed.connect(_set_value)
	
func _set_value(air_presure:AirPresure):
	value = air_presure.value

func _on_value_changed(value_):
	if value_ < 30:
		modulate = Color(1/value, 0.094 , value/30 )
	else:
		modulate = Color(0.325, 0.094, 1)
