extends Node2D

@onready var saves = Main
@onready var dia = $main
@onready var dialogBox = dia.dialogBox
@onready var dialog = dia.text.text
@onready var btnRight = dia.btn1
@onready var btnLeft = dia.btn2
@onready var btnDown = dia.btn3
const right = "res://couchLivingroom.tscn"
const left = "res://paintingLivingroom.tscn"
const down = null

# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("room") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_canvas_pressed():
	dia.collect($wall/canvas, "canvas")
	



func _on_box_pressed():
	get_tree().change_scene_to_file("res://box.tscn")


func _on_door_pressed():
	dia.caraWrite("Locked")
