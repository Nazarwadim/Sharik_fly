extends Area2D
class_name Ball
@export var start_speed:float = 200
@export var start_speed_increase:float = 1
@export var move_toward_y:float
@export var start_air_presure:float = 20
@export var air_presure_restoration:float = 30
@export var air_presure_restoration_while_down:float = 40
@export var air_presure_decrease:float = 70

@onready var air_presure:AirPresure = $AirPresure
@onready var phisics:BallPhisics = $Phisics
@onready var sound_controler:BallSoundController = $SoundControler
@onready var trail:GPUParticles2D = $Trail

func _process(delta) -> void:
	$HighestScore.update_highest_score(position)
	
func _physics_process(delta) -> void:
	position += phisics.velocity * delta 
	position.y = clampf(position.y, -1000, 0)


