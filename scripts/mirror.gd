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
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mirror_pressed():
	if  dia.inv.size() != 0 && dia.inv[dia.invCurrent] == "cam":
		dia.caraWrite("The mirror still works in the photo I guess")
		
		
		if dia.inv.has("caraPhoto") || dia.inv.has("caraUndressedPhoto"):
			pass
		else:
			if saves.saveVars[saves.dressed]:
				dia.collect(null, "caraPhoto")
			else:
				dia.collect(null, "caraUndressedPhoto")
				
		
	else:
		dia.caraWrite("...")
		await get_tree().create_timer(1.0).timeout
		dia.caraWrite("The mirror must be broken")
