extends Control

func _ready():
	SignalBus.on_score_changed.connect(_update_score)
	SignalBus.on_highest_score_changed.connect(_update_highest_score)

func _update_score(_node:Node, score:float):
	$current/Label.text = str( int( score ) )
	

func _update_highest_score(_node:Node, score:float):
	$record/Label.text = str( int( score ) )
