extends Node2D

@onready var saves = Main
@onready var dia = $main
@onready var dialogBox = dia.dialogBox
@onready var dialog = dia.text.text
@onready var btnRight = dia.btn1
@onready var btnLeft = dia.btn2
@onready var btnDown = dia.btn3
var right = null
var left = null
var down = "res://mirrorBedroom.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("inset")
	if saves.saveVars["dressed"]:
		$TextureRect/TextureRect.visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$TextureRect/TextureRect.visible = false
	dia.caraWrite("That's my dress")
	await get_tree().create_timer(1.5).timeout
	dia.caraWrite("I've gotten changed")
	saves.saveVars[saves.dressed] = true
