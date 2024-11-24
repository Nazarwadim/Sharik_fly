extends Node

@export var images_to_load:PackedStringArray
@onready var progress: Node2D = $Progress

@onready var dynamic_image_loader: Node = $DynamicImageLoader
func _ready() -> void:
	var scene := load("res://scenes/game/game.tscn")
	var current_persetnage = 0
	var increment := 100.0 / 4.0
	current_persetnage += increment
	progress.set_persentage(current_persetnage)
	
	for path in images_to_load:
		Globals.loaded_remote_images[path] = await dynamic_image_loader.load_image(path)
		current_persetnage += increment
		progress.set_persentage(current_persetnage)
	await get_tree().create_timer(0.2).timeout
	queue_free()
	get_node("/root/").add_child.call_deferred(scene.instantiate())
