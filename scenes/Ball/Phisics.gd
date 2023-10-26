extends Node
class_name BallPhisics
@onready var speed:float = 0
@onready var speed_increase:float = 0
@onready var velocity:Vector2 = Vector2(0,0)


func _physics_process(delta) -> void:
	speed += speed_increase * delta
