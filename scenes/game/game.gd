extends Node

func _physics_process(delta) -> void:
	var value = $Player.air_presure
	$UI.set_presure_value( value )
