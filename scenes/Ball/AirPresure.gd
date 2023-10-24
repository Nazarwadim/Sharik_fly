extends Node
class_name AirPresure
var value:float = 1

var block_airpresure_up:bool = false

func _physics_process(delta) -> void:
	if value <= 0:
		block_airpresure_up = true
	if value > 50:
		block_airpresure_up = false

func move_in_state_idle(air_presure_restoration:float, delta:float) -> void:
	value = move_toward(value, 100, air_presure_restoration * delta)
	SignalBus.on_airpresure_changed.emit(self)

func move_in_state_down(air_presure_restoration_while_down:float, delta:float) -> void:
	value = move_toward( value, 100, air_presure_restoration_while_down * delta)
	SignalBus.on_airpresure_changed.emit(self)

func move_in_state_up(air_presure_decrease:float, delta:float) -> void:
	value -= move_toward( 0 ,value , air_presure_decrease * delta)
	SignalBus.on_airpresure_changed.emit(self)
