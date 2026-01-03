extends Node2D

@onready var saves = Main
var left = "res://bedroom.tscn"
var right = "res://doorWallBedroom.tscn"
var down = null


@onready var dia = $main
@onready var dialogBox = dia.dialogBox
@onready var dialog = dia.text.text
@onready var btnRight = dia.btn1
@onready var btnLeft = dia.btn2
@onready var btnDown = dia.btn3
@onready var knife = $TextureRect/TextureRect2
@onready var knifeDec = $knife




# Called when the node enters the scene tree for the first time.


func _ready():
	dia.setup("room")
	
	if saves.saveVars[saves.knife] == false:
		knife.visible = false
		
	if saves.saveVars[saves.chestOpen]:
		$TextureRect/TextureRect.texture = load("res://assets/chestopen.PNG")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_chest_pressed():
	if !saves.saveVars[saves.chestOpen]:
		if dia.inv.size() != 0 && dia.inv[dia.invCurrent]!= null && dia.inv[dia.invCurrent] == "key":
			$TextureRect/TextureRect.texture = load("res://assets/chestopen.PNG")
			dia.use("key")
			saves.saveVars[saves.chestOpen] = true
		else:
			dia.caraWrite("Locked")
	elif saves.saveVars[saves.chestOpen]:
		get_tree().change_scene_to_file("res://chest.tscn")



func _on_mirror_pressed():
	get_tree().change_scene_to_file("res://mirror.tscn")



func _on_knife_pressed():
	dia.collect(knife, "knife")
	saves.saveVars[saves.knife] = false

