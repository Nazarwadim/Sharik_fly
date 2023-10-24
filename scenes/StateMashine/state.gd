extends Node

class_name State

@export var can_move : bool = true

var ball : Ball
var animation :  AnimatedSprite2D
var sound_controler: BallSoundController
var next_state : State

signal interrupt_state(new_state:State)

func state_process(delta):
	pass

func state_input(event : InputEvent):
	pass

func on_enter():
	pass

func on_exit():
	pass
