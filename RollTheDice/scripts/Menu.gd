extends Control



func _on_Play_pressed():
	loadGame()
	
func loadGame():
	get_tree().change_scene("res://scenes/Main.tscn")
