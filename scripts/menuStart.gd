extends Node2D

@onready var saves = Main
# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)  # Replace with function body. # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_load_btn_pressed():
	
	if FileAccess.file_exists("user://savegame.save"):
		var file = FileAccess.open("user://savegame.save", FileAccess.READ)
		saves.saveVars = file.get_var()
		saves.invGlobal = file.get_var()
		file.close()
	else:
		saves.saveVars = saves.defaults
		saves.save()
	get_tree().change_scene_to_file("res://bedroom.tscn")


func _on_new_game_btn_pressed():
	
	saves.saveVars = saves.defaults
	saves.invGlobal.clear()
	saves.save()
	get_tree().change_scene_to_file("res://bedroom.tscn")
	

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")


func _on_exit_pressed():
	get_tree().quit()
