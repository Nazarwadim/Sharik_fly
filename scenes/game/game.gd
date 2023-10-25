extends Node
class_name Game

@onready var _ball_scene_path = $Ball.get_scene_file_path()

func _ready():
	randomize()
	SignalBus.player_died.connect(player_died)

func player_died(ball):
	await get_tree().create_timer(1).timeout
	$Ball.queue_free()
