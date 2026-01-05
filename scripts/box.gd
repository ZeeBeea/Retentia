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
var down = "res://doorLivingroom.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("inset")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_knifebtn_pressed():
	dia.collect($Knife, "knife")


func _on_matchesbtn_pressed():
	dia.collect($Matches, "matches")


func _on_spoonbtn_pressed():
	dia.collect($Spoon, "spoon")
