extends CanvasLayer
class_name UI
@export var game:Game

@onready var gui:ColorRect = $GUi
@onready var gui_label:Label = $GUi/Label
@onready var setting_button:TextureButton = $SettingsButton
func _ready():
	SignalBus.on_start_button_preased.connect(start)
	SignalBus.on_startUI_button_preased.connect(stop)
	SignalBus.player_died.connect(_player_died)

	
func start():
	show()
	var tween = get_tree().create_tween()
	for item in get_children():
		if item is Control:
			item.modulate.a = 0
			tween.tween_property(item, "modulate", Color(item.modulate.r,item.modulate.g,item.modulate.b,1) ,0.2)
	tween.play()
	gui_label.text = "Game Paused!!!!!!"
	gui_label.label_settings.font_color.g = 150/255.0


func _on_settings_button_toggled(button_pressed:bool):
	gui.visible = button_pressed
	$Control.visible = not button_pressed

func _player_died(ball):
	setting_button.button_pressed = true
	gui_label.text = "You died("
	gui_label.label_settings.font_color.g = 0

func stop():
	hide()
