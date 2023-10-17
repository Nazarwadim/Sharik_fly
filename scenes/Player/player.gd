extends Area2D
class_name Player
@export var speed:float = 200
@export var speed_increase:float = 1
@export var speed_increase_decrease:float = 0.1
@export var move_toward_y:float
enum state{
	idle,
	up,
	down
}

@onready var velocity = Vector2(speed, 0)
@onready var current_state:state 

func _physics_process(delta):
	input()
	
	speed_increase -= speed_increase_decrease * delta
	speed += speed_increase * delta
	
	if current_state == state.idle:
		velocity.x = speed
		velocity.y = 0
		position.y = move_toward(position.y, move_toward_y, 0.3 * velocity.x * delta)		
	elif current_state == state.down:
		velocity.y = 0.5 * velocity.x 
	elif current_state == state.up:
		velocity.y = -0.5 * velocity.x
		

	
	

	position += velocity * delta 
	
	
func _process(delta):
	if current_state == state.idle:
		$AnimatedSprite2D.play("idle")
	elif current_state == state.up:
		$AnimatedSprite2D.play("up")
	elif current_state == state.down:
		$AnimatedSprite2D.play("down")
	else:
		printerr("Error in Player state. You add aditional state!!!! player.gd 26")

func input():
	if Input.is_action_pressed("down"):
		current_state = state.down
	elif Input.is_action_pressed("up"):
		current_state = state.up
	else:
		current_state = state.idle
