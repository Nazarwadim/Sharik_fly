extends Node2D
class_name StartUi
@onready var exit_button = $RigidBody2D/ExitButton

func _ready():
	SignalBus.on_startUI_button_preased.connect(_set_rigidbody_button)
	SignalBus.on_start_button_preased.connect(_start_button_preased)
	
func _start_button_preased():
	$RigidBody2D.gravity_scale = 1
	$RigidBody2D.sleeping = false

func _set_rigidbody_button():
	$RigidBody2D.gravity_scale = 0
	$RigidBody2D.sleeping = true
	$RigidBody2D.position = $StartButtonPosition.position
