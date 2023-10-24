extends CanvasLayer
class_name UI
@export var game:Game

func _ready():
	SignalBus.on_start_button_preased.connect(start)
	
func start():
	show()
	
