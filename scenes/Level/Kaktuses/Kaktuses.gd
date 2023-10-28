extends Node2D
class_name Kaktus_generaor
@export var kaktuses:Array

var _generation_x_position:float
@export var probability_of_skipping_generation_percentage:float = 33
@export var max_generated_kaktuses:int = 4
func generate_kaktus(player:Ball) -> void:
	if probability_of_skipping_generation_percentage < 0 or probability_of_skipping_generation_percentage > 100:
		printerr("Too large or small probability_of_skipping_generation Kaktuses.gd 10")
		
	var skip_generation_number = randf_range(0,100)
	if skip_generation_number < probability_of_skipping_generation_percentage:
		return
		
	for i in range(0,randi_range(1, max_generated_kaktuses)):
		var kaktus = _create_kaktuse( randi_range(0,kaktuses.size() - 1), randf_range(-8,8) , player)
		add_child(kaktus)
	_generation_x_position = 0
	_width_of_past_kactus = 0
	
	
var _width_of_past_kactus:float = 0
func _create_kaktuse(generated_index:int, generated_position_y:float,player:Area2D) -> Kaktus:
	var kaktus:Area2D = kaktuses[generated_index].instantiate()
	var kaktus_width = kaktus.get_node("VisibleOnScreenNotifier2D").scale.x * kaktus.get_node("VisibleOnScreenNotifier2D").rect.size.x 
	var spacing:float
	if _width_of_past_kactus != 0:
		spacing = (_width_of_past_kactus + kaktus_width)/2
	else:
		spacing = 0
	
	_generation_x_position += spacing
	kaktus.position.x = player.position.x + _generation_x_position + 1000
	kaktus.position.y = generated_position_y
	_width_of_past_kactus = kaktus_width
	
	return kaktus

