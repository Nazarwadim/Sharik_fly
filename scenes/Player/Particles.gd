extends GPUParticles2D
var player:Player
func _ready():
	player = get_parent()


func _on_player_on_state_changed(state):
	trail_enabled = ! state == player.state.up
