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
var down = "res://firePlaceWall.tscn"

@onready var books = $Book1
# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("inset")
	
	if saves.saveVars[saves.cam] == false:
		$cam.visible = false
	
	books.bookSorted.connect(onBookSorted)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cambtn_pressed():
	$cam.visible = false
	$cam/cambtn.visible = false
	dia.collect($cam, "cam")
	saves.saveVars[saves.cam] = false
	
func onBookSorted():
	if saves.invGlobal.has("journal") :#|| saves.saveVars["bookOnStand"]:
		pass
	else:
		dia.collect(null, "journal")
