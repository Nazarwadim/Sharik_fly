extends Control

func _physics_process(delta) -> void:
	$current/Label.text = str( int(get_parent().get_parent().player.position.x) )
	$record/Label.text = str( int(get_parent().get_parent().player.high_score) )
