extends Node2D
@export var player:Ball
@export var kaktuses_generation_frequency_distance:float = 500
@export var cloud_generation_frequency_dustance:float = 1000
signal on_kaktus_generate
signal on_cloud_generate

func _ready():
	SignalBus.on_start_button_preased.connect(start_generation)

	
func on_generate_timer_timeout() -> void:
	$Kaktuses_generator/Timer.wait_time = kaktuses_generation_frequency_distance / player.phisics.speed
	$Kaktuses_generator.generate_kaktus(player)
	on_kaktus_generate.emit()



func _on_cloud_timer_timeout() -> void:
	$Cloud_Paralax/Timer.wait_time = cloud_generation_frequency_dustance / player.phisics.speed
	$Cloud_Paralax.generate_cloud(player)
	on_cloud_generate.emit()



func start_generation():
	$Kaktuses_generator/Timer.start(1)
	$Cloud_Paralax/Timer.start(1)


#func _on_player_on_died():
#	$Cloud_Paralax/Timer.stop()
#	$Kaktuses_generator/Timer.stop()


#func _on_player_on_restart():
#	$Cloud_Paralax/Timer.start()
#	$Kaktuses_generator/Timer.start()

