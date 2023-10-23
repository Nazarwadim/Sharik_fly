extends Node

func _on_player_on_state_changed(state):
	var player:Player = get_parent()
	if state == player.state.idle:
		$UpSound.stop()
		$DownSound.pitch_scale = $DownSound.stream.get_length() / (100 / player.air_presure_restoration) 
		$DownSound.play(abs( $DownSound.stream.get_length() * player.air_presure / 100 - 0.1 ))
		
	elif state == player.state.down:
		$UpSound.stop()
		$DownSound.pitch_scale = $DownSound.stream.get_length() / (100 / player.air_presure_restoration_while_down)
		$DownSound.play(abs($DownSound.stream.get_length() * player.air_presure / 100 - 0.1 ))
		
	elif state == player.state.up:
		$DownSound.stop()
		$UpSound.pitch_scale = $UpSound.stream.get_length() / ( 100 / player.air_presure_decrease_decrease)
		$UpSound.play( abs( $UpSound.stream.get_length() * (100 - player.air_presure) / 100 - 0.1 ) )
		
	elif state == player.state.die:
		$DownSound.stop()
		$UpSound.stop()
		$LopnuvSound.pitch_scale = randf_range(0.8, 1.2)
		$LopnuvSound.play()
