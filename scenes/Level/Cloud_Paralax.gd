extends ParallaxBackground
class_name Clouds_generator
@export var clouds:Array

func generate_cloud(player:Player) -> void:
	var first = randi_range(0,2)
	if first == 2:
		return
	add_cloud( randi_range(0, clouds.size() - 1), randi_range(-100, 390), randi_range(0,2) , player)
		
func add_cloud(generated_index:int, generated_hight:int, generated_layer_index , player:Player) -> void:
	var cloud = Sprite2D.new()
	var scale_x = get_node("clouds_layer" + str(generated_layer_index)).get("motion_scale").x;

	cloud.texture = clouds[generated_index]
	cloud.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST;
	cloud.position = Vector2(1300 + player.position.x * scale_x, generated_hight * scale_x)
	
	get_node("clouds_layer" + str(generated_layer_index)).add_child(cloud)
	
	
