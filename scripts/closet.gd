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
var down = "res://bedroom.tscn"


@onready var bg = $TextureRect

func _ready():
	dia.setup("inset")
	

	
func _physics_process(delta):
	pass


func _onRedButtonPressed():
	dia.caraWrite("That's Meri's old dress, I want to wear my new dress")


func _on_yellow_pressed():
	dia.caraWrite("That's Bon's old dress, I want to wear my new dress")

