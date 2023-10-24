extends Node2D
class_name Kaktus_generaor
@export var kaktuses:Array
var kaktus_width:float

func generate_kaktus(player:Player) -> void:
	var first = randi_range(0,2)
	if first == 2:
		return
	for i in range(0,randi_range(1,4)):
		await  get_tree().create_timer((kaktus_width + 2)/player.speed).timeout
		_add_kaktuse( randi_range(0,kaktuses.size() - 1), randf_range(-10,10) , player)
	
	
func _add_kaktuse(generated_index:int, generated_position_y:float,player:Player) -> void:
	var kaktus:Area2D = kaktuses[generated_index].instantiate()
	kaktus_width = kaktus.get_node("VisibleOnScreenNotifier2D").scale.x * 10 
	kaktus.position.x = player.position.x + 1000
	kaktus.position.y = generated_position_y
	add_child(kaktus)
			
