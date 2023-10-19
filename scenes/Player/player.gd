extends Area2D
class_name Player
@export var speed:float = 200
@export var speed_increase:float = 1
@export var move_toward_y:float
@export var air_presure:float = 20
@export var air_presure_restoration:float = 30
@export var air_presure_restoration_while_down:float = 40
@export var air_presure_decrease_decrease:float = 70
@onready var velocity = Vector2(speed, 0)
signal on_state_changed(state:state)
signal on_died
var current_state:state 
var high_score:int

enum state{
	idle,
	up,
	down,
	die
}

func _physics_process(delta) -> void:	
	if current_state == state.die:
		return;
	if Input.is_action_pressed("down"):
		change_state(state.down)
	elif Input.is_action_pressed("up") && air_presure > 0 && not $AirPresure.block_airpresure_up:
		change_state(state.up)
	else:
		change_state(state.idle)	
	
func change_state(state_:state):
	if(state_ != current_state):
		current_state = state_
		on_state_changed.emit(current_state)

func save():
	var save_dict ={
		"high_score": high_score
	}
	return save_dict
