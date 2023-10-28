extends ParallaxBackground
class_name Clouds_generator
@export var clouds:Array
@export var probability_of_skipping_generation_percentage:float = 33

func generate_cloud(player:Area2D) -> void:
	if probability_of_skipping_generation_percentage < 0 or probability_of_skipping_generation_percentage > 100:
		printerr("Too large or small probability_of_skipping_generation Kaktuses.gd 10")
		
	var skip_generation_number = randf_range(0,100)
	if skip_generation_number < probability_of_skipping_generation_percentage:
		return
	
	var generated_layer_index = randi_range(0,2)
	var cloud = _create_cloud( randi_range(0, clouds.size() - 1), randi_range(-100, 390),generated_layer_index , player)
	get_node("clouds_layer" + str(generated_layer_index)).add_child(cloud)
		
func _create_cloud(generated_index:int, generated_hight:int,generated_layer_index:int, player:Area2D) -> Node2D:
	var cloud = clouds[generated_index].instantiate()
	var scale_x = get_node("clouds_layer" + str(generated_layer_index)).get("motion_scale").x;
	cloud.position = Vector2(1500 + player.position.x * scale_x, generated_hight * scale_x)
	return cloud
	
