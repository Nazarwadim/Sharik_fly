extends Node

signal on_airpresure_changed(air_presure:AirPresure)

signal on_score_changed(node:Node, score : float)
signal on_highest_score_changed(node:Node, score:float)

signal on_start_button_preased()
signal on_pause_button_preased()
signal on_restart_button_preased()

signal player_died(ball:Ball)
