extends Node2D

@onready var saves = Main
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass







func _on_exit_pressed():
	saves.save()
#	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
#	save_file.store_var(saves.saveVars)
#	save_file.close()
#	get_tree().change_scene_to_file("res://menuStart.tscn")

	
