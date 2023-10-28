extends Node2D
@export var wind_scene:PackedScene

@export var wind_generation_area:Rect2 = Rect2(Vector2(-500,-600), Vector2(1000, 600))


func generate_wind(ball:Ball):
	if randi_range(0,3) == 3:
		return
	for i in range(0, randi_range(1,2)):
		var setup_x = randf_range( 0, wind_generation_area.size.x )
		var setup_y = randf_range( 0, wind_generation_area.size.y )
		var wind_setup_position = Vector2(setup_x + wind_generation_area.position.x,setup_y + wind_generation_area.position.y)
		var wind_trail_speed = randf_range(0.5,0.5001 + ball.phisics.speed/500.0)
		var wind_trail_length = randf_range(0.5, 1)
		add_wind_to_level(ball.position, wind_setup_position, wind_trail_speed, wind_trail_length)
		await get_tree().create_timer(randf_range(0.01, 1)).timeout

func add_wind_to_level(ball_position:Vector2, wind_setup_position:Vector2, wind_trail_speed:float, wind_trail_length:float):
	var wind = wind_scene.instantiate(PackedScene.GEN_EDIT_STATE_MAIN) as WindGust
	wind.set_wind_path_position(ball_position + wind_setup_position)
	wind.trail_speed = wind_trail_speed
	wind.trail_length = wind_trail_length
	add_child(wind)
