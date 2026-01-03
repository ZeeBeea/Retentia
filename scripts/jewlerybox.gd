extends Node2D

@onready var saves = Main


@onready var buttons = [$Boxop/TextureRect3/Button, $Boxop/TextureRect2/Button2, $Boxop/TextureRect/Button3, $Boxop/TextureRect4/Button4, $Boxop/TextureRect5/Button5, $Boxop/TextureRect6/Button6, $Boxop/TextureRect7/Button7, $Boxop/TextureRect8/Button8, $Boxop/TextureRect9/Button9]
@onready var textures = [$Boxop/TextureRect3, $Boxop/TextureRect2, $Boxop/TextureRect, $Boxop/TextureRect4, $Boxop/TextureRect5, $Boxop/TextureRect6, $Boxop/TextureRect7, $Boxop/TextureRect8, $Boxop/TextureRect9]
@onready var code1 = [true, false, false, true, true, true, false, false, true,]
@onready var code2 = [true, false, true, false, true, false, true, false, true]
@onready var input  = [false, false,false,false,false,false,false,false,false,]
@onready var dia = $main
@onready var dialogBox = dia.dialogBox
@onready var dialog = dia.text.text
@onready var btnRight = dia.btn1
@onready var btnLeft = dia.btn2
@onready var btnDown = dia.btn3
var right = null
var left = null
var down = "res://firePlaceWall.tscn"
@onready var candle = $Boxop/Openleft/candle
@onready var makeup = $Boxop/Openright/makeup
@onready var matches = $Boxop/Openright/matches





func _ready():
	dia.setup("inset")
	connectAll()
	if saves.saveVars[saves.jewleryLeftOpen]:
		$Boxop/Openleft.visible = true
	if saves.saveVars[saves.jewleryRightOpen]:
		$Boxop/Openright.visible = true
	if !saves.saveVars[saves.candle]:
		candle.visible = false
	if !saves.saveVars[saves.makeup]: 
		makeup.visible = false
	if !saves.saveVars[saves.matches]: 
		matches.visible = false




	
func connectAll():
	var i = 0
	for button in buttons:
		var pressBind = Callable(pressButton)
		pressBind = pressBind.bind(button)
		button.pressed.connect(pressBind)
		i = i + 1


func pressButton(currBtn):
	var index = buttons.find(currBtn)
	if input[index] == false:
		textures[index].texture = load("res://assets/jewlerybox/butdown.PNG")
		input[index] = true
		
	elif input[index] == true:
		textures[index].texture = load("res://assets/jewlerybox/butup.PNG")
		input[index] = false
	
	if input == code1:
		$Boxop/Openleft.visible = true
		saves.saveVars[saves.jewleryLeftOpen] = true
	if input == code2:
		$Boxop/Openright.visible = true
		saves.saveVars[saves.jewleryRightOpen] = true
	




func _on_candle_btn_pressed():
	dia.collect($Boxop/Openleft/candle, "candle")
	saves.saveVars[saves.candle] = false


func _on_makeup_btn_pressed():
	dia.collect($Boxop/Openright/makeup, "makeup")
	saves.saveVars[saves.makeup] = false


func _on_matches_btn_pressed():
	dia.collect($Boxop/Openright/matches, "matches")
	saves.saveVars[saves.matches] = false
