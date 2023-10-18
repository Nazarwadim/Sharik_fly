extends Area2D
class_name Kaktus

func _ready() -> void:
	$AnimatedSprite2D.play()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	await  get_tree().create_timer(20).timeout
	queue_free()
