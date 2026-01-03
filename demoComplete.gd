extends Node2D
@onready var music = MusicController
@onready var screen = load("res://shelf3.tscn")



@onready var demoComplete = $ColorRect
@onready var endScreen = $end

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	UI.audioPlayer = UI.TextureRect.ColorRect.Volume.value
	get_tree().change_scene_to_file("res://menuStart.tscn")


	
