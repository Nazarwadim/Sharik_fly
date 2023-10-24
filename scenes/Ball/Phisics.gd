extends Node
class_name BallPhisics
var speed:float
var speed_increase:float
@onready var velocity:Vector2 = Vector2(0,0)


func _physics_process(delta) -> void:
	speed += speed_increase * delta
