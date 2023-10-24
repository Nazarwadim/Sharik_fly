extends Node
class_name BallPhisics
var speed:float
var speed_increase:float
@onready var velocity:Vector2 = Vector2(0,0)


func _process(delta):
	speed += speed_increase * delta
