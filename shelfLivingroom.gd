extends Node2D

@onready var saves = Main
@onready var dia = $main
@onready var dialogBox = dia.dialogBox
@onready var dialog = dia.text.text
@onready var btnRight = dia.btn1
@onready var btnLeft = dia.btn2
@onready var btnDown = dia.btn3
const right = "res://paintingLivingroom.tscn"
const left = "res://couchLivingroom.tscn"
const down = null
# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("room")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_chest_pressed():
	get_tree().change_scene_to_file("res://chickenShelf.tscn")


func _on_mortar_pressed():
	get_tree().change_scene_to_file("res://shelf2.tscn")


func _on_paintbrush_pressed():
	pass # Replace with function body.
