extends Node2D

@onready var saves = Main
@onready var dia = $main
@onready var dialogBox = dia.dialogBox
@onready var dialog = dia.text.text
@onready var btnRight = dia.btn1
@onready var btnLeft = dia.btn2
@onready var btnDown = dia.btn3
const right = "res://shelfLivingroom.tscn"
const left = "res://doorLivingroom.tscn"
const down = null
# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("room")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_meri_pressed():
	$Meri.texture = load("res://livingroom/couchWallLivingRoom/meriTalkStart.PNG")
	await get_tree().create_timer(0.5).timeout
	$Meri.texture = load("res://livingroom/couchWallLivingRoom/meri.PNG")


func _on_bon_pressed():
	if saves.saveVars["gemObtained"]:
		$Bon.texture = load("res://livingroom/couchWallLivingRoom/bonTalk.PNG")
		dia.bonWrite("Pretty, Right?")
		await get_tree().create_timer(1).timeout
		$Bon.texture = load("res://livingroom/couchWallLivingRoom/bon.PNG")
	else:
		$Bon.texture = load("res://livingroom/couchWallLivingRoom/bonTalk.PNG")
		dia.bonWrite("Look what I found!")
		dia.collect(null, "gem")
		saves.saveVars["gemObtained"] = true
		await get_tree().create_timer(1).timeout
		$Bon.texture = load("res://livingroom/couchWallLivingRoom/bon.PNG")
