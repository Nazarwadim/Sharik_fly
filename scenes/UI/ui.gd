extends CanvasLayer
class_name UI
@export var game:Game
@onready var gui:ColorRect = $GUi
@onready var gui_label:Label = $GUi/Label
func _ready():
	SignalBus.on_start_button_preased.connect(start)
	SignalBus.on_startUI_button_preased.connect(stop)
	
func start():
	show()
	var tween = get_tree().create_tween()
	for item in get_children():
		if item is Control:
			item.modulate.a = 0
			tween.tween_property(item, "modulate", Color(item.modulate.r,item.modulate.g,item.modulate.b,1) ,0.2)
	tween.play()



func _on_settings_button_toggled(button_pressed:bool):
	gui.visible = button_pressed
	$Control.visible = not button_pressed

func stop():
	hide()
