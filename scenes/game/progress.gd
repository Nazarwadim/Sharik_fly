extends Node2D


@onready var chmara_1: Sprite2D = $Chmara1
@onready var marker_2d: Marker2D = $Marker2D

func set_persentage(value:int):
	var persentage = clamp(value, 0, 100)
	chmara_1.position.x = remap(persentage, 0.0, 100.0, 0.0, marker_2d.position.x)
