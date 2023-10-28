extends Node2D
@export var wind_scene:PackedScene

@export var wind_generation_area:Rect2 = Rect2(Vector2(-800,-600), Vector2(1100, 600))
@export var probability_of_skipping_generation_percentage:float = 33

func generate_wind(ball:Ball):
	if probability_of_skipping_generation_percentage < 0 or probability_of_skipping_generation_percentage > 100:
		printerr("Too large or small probability_of_skipping_generation Kaktuses.gd 10")
		
	var skip_generation_number = randf_range(0,100)
	if skip_generation_number < probability_of_skipping_generation_percentage:
		return
	
	for i in range(0, randi_range(1,2)):
		var setup_x = randf_range( 0, wind_generation_area.size.x )
		var setup_y = randf_range( 0, wind_generation_area.size.y )
		var wind_setup_position = Vector2(setup_x + wind_generation_area.position.x,setup_y + wind_generation_area.position.y)
		var wind_trail_speed = randf_range(0.4, 0.5001 + ball.phisics.speed/1000.0)
		var wind_trail_length = randf_range(0.5, 1)
		var wind = _create_wind(ball.position, wind_setup_position, wind_trail_speed, wind_trail_length)
		add_child(wind)
		await get_tree().create_timer(randf_range(0.01, 1)).timeout

func _create_wind(ball_position:Vector2, wind_setup_position:Vector2, wind_trail_speed:float, wind_trail_length:float) -> WindGust:
	var wind = wind_scene.instantiate() as WindGust
	wind.set_wind_path_position(ball_position + wind_setup_position)
	wind.trail_speed = wind_trail_speed
	wind.trail_length = wind_trail_length
	return wind
