extends Node
class_name BallSoundController

func get_sound_length(sound_name:String) -> float:
	return get_node(sound_name).stream.get_length()

func play_sound(sound_name:String, pitch_scale:float, from:float) -> void:
	stop_play()
	get_node(sound_name).pitch_scale = pitch_scale
	get_node(sound_name).play(from)

func stop_play():
	for i in get_children():
		i.stop()
