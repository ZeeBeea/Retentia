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
var down = "res://shelfLivingroom.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("inset")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_chicken_pressed():
	if dia.inv.size() > 0:
		if dia.inv[dia.invCurrent] == "seeds":
			dia.collect(null, "egg")
			saves.saveVars["eggCollected"] = true
		elif dia.inv[dia.invCurrent] == "knife" && saves.saveVars["eggCollected"]:
			$TextureRect/TextureRect.texture = load("res://livingroom/shelfs/shelf1/chickenstabed.PNG")
