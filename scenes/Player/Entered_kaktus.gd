extends Node
func _on_player_area_entered(area:Area2D) -> void:
	if area is Kaktus:
		get_parent().current_state = get_parent().state.die;
		
		var animated_sprite:AnimatedSprite2D = get_node("../AnimatedSprite2D")
		if not animated_sprite.animation_looped.is_connected(_on_die_animation_finished):
			animated_sprite.animation_looped.connect(_on_die_animation_finished)
func _on_die_animation_finished() -> void:
	get_parent().process_mode = Node.PROCESS_MODE_DISABLED
	get_parent().visible = false;

