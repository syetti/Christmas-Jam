extends Button


func _on_Button_pressed():
	PlayerData.reset_deaths()
	PlayerData.reset_level()
	PlayerData.reset_score()
	get_tree().change_scene_to_file("res://Levels/Main.tscn")
	queue_free()
	pass # Replace with function body.
