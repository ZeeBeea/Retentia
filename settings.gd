extends Node2D
@onready var saves = Main

# Called when the node enters the scene tree for the first time.
func _ready():
	if saves.saveVars != saves.defaults:
		$TextureRect/ColorRect/Volume.value = saves.saveVars[saves.globalVolume] * 100
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	




func _on_return_pressed():
	saves.save()
	get_tree().change_scene_to_file("res://menuStart.tscn")






func _on_full_screen_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)  # Replace with function body.


func _on_minimize_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED) 


func _on_mut_pressed():
	if !saves.saveVars[saves.muted]:
		saves.saveVars[saves.muted] = true
		$TextureRect/ColorRect/mute.icon = load("res://UIFiles/mute.png")
	elif saves.saveVars[saves.muted]: 
		saves.saveVars[saves.muted] = false
		$TextureRect/ColorRect/mute.icon = load("res://UIFiles/volume.png")
		$TextureRect/ColorRect/mute.expand_icon = true
		
	MusicController.updateVolume()


	saves.saveVars[saves.globalVolume] = $TextureRect/ColorRect/Volume.value /100
	MusicController.updateVolume()


func _on_volume_value_changed(value):
	saves.saveVars[saves.globalVolume] = $TextureRect/ColorRect/Volume.value /100
	MusicController.updateVolume()
