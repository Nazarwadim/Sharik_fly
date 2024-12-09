extends Node2D
@export var player:Ball
@export var kaktuses_generation_frequency_distance:float = 500
@export var cloud_generation_frequency_dustance:float = 1000
@onready var wind_timer:Timer = $Wind_generator/Timer

signal on_kaktus_generate
signal on_cloud_generate

func _ready():
	_set_loaded_assets()
	SignalBus.on_start_button_preased.connect(start_generation)
	SignalBus.player_died.connect(stop_generation)	

func stop_generation(_balL):
	$Kaktuses_generator/Timer.stop()
	$Cloud_Paralax/Timer.stop()
	
func start_generation():
	$Kaktuses_generator/Timer.start(1)
	$Cloud_Paralax/Timer.start(1)
	
	
func on_generate_timer_timeout() -> void:
	$Kaktuses_generator/Timer.wait_time = kaktuses_generation_frequency_distance / player.phisics.speed
	$Kaktuses_generator.generate_kaktus(player)
	on_kaktus_generate.emit()

func _on_cloud_timer_timeout() -> void:
	$Cloud_Paralax/Timer.wait_time = cloud_generation_frequency_dustance / player.phisics.speed
	$Cloud_Paralax.generate_cloud(player)
	on_cloud_generate.emit()

func _on_generate_wind_timer_timeout():
	$Wind_generator/Timer.wait_time = randf_range(2,5)
	$Wind_generator.generate_wind(player)

func _set_loaded_assets():
	var images:Dictionary = Globals.loaded_remote_images
	if images.is_empty():
		return
	_set_texture_for_texture_rect($ParallaxBackground/sky_layer/TextureRect, images["sky.png"])
	_set_texture_for_texture_rect($ParallaxBackground/mountain_layer/TextureRect, images["mountains.png"])
	_set_texture_for_texture_rect($ParallaxBackground/ball_layer/TextureRect, images["sand.png"])

func _set_texture_for_texture_rect(texture_rect, image):
	if image == null:
		return
	var texture := ImageTexture.new()
	texture.set_image(image)
	texture_rect.texture = texture
