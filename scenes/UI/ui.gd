extends CanvasLayer
class_name UI
signal restart_button_clicked()
signal start_menu_button_clicked()
@export var game:Game
@export var player:Player

func set_presure_value(value:float) -> void:
	$Tools/Air/AirBar.value = value
