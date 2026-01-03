extends Node2D


@onready var saves = Main
@onready var dia = $main
@onready var dialogBox = dia.dialogBox
@onready var dialog = dia.text.text
@onready var btnRight = dia.btn1
@onready var btnLeft = dia.btn2
@onready var btnDown = dia.btn3
var right = "res://firePlaceWall.tscn"
var left = "res://mirrorBedroom.tscn"
var down = null


# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("room")
	if saves.saveVars[saves.candleInChest]:
		$box/boxopen/unlitCandle.visible = true
	if saves.saveVars[saves.candleLit]: 
			$box/boxopen/bg.visible = true
			$box/boxopen/unlitCandle.visible = false
			$box/boxopen/bg/candle.visible = true
			$box/boxopen/bg/candle.play("lit")
			if !saves.saveVars[saves.mouse]:
				$box/boxopen/bg/mouse.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _onDoorPressed():
	if  !saves.saveVars[saves.dressed]:
		dia.meriWrite("Have you gotten dressed yet?")
	elif saves.saveVars[saves.dressed]:
		if $hallway.visible == false:
			if !saves.saveVars[saves.meriInside]:
				$hallway.visible = true
				$hallway/meri.visible = true
				dia.meriWrite("May I come inside?")
				saves.saveVars[saves.meriInside] = true
			elif saves.saveVars[saves.meriInside] && !saves.saveVars[saves.bonInside]:
				$hallway.visible = true
				$hallway/bon.visible = true
				dia.bonWrite("Good morning Cara!")
				saves.saveVars[saves.bonInside] = true
			elif saves.saveVars[saves.meriInside] && saves.saveVars[saves.bonInside]:
				dia.caraWrite("Locked")


func _on_chessbtn_pressed():
	if $box/boxopen.visible == false:
		$box/boxopen.visible = true
	else:
		if !saves.saveVars[saves.candleInChest]:
			if dia.inv.size() > 0 && dia.inv[dia.invCurrent] == "candle":
				$box/boxopen/unlitCandle.visible = true
				saves.saveVars[saves.candleInChest] = true
				dia.use("candle")
			else:
				dia.caraWrite("It's too dark")
		else: 
			if dia.inv.size() > 0 && dia.inv[dia.invCurrent] == "matches":
				$box/boxopen/bg.visible = true
				$box/boxopen/unlitCandle.visible = false
				$box/boxopen/bg/candle.visible = true
				$box/boxopen/bg/candle.play("lit")
				$box/mouseBtn.visible = true
				saves.saveVars[saves.candleLit] = true
				if saves.saveVars[saves.fireplace] == "lit":
					dia.use("matches")
			


func _on_mouse_btn_pressed():
	dia.collect($box/boxopen/bg/mouse, "mouse")
	$box/mouseBtn.visible = false
	saves.saveVars[saves.mouse] = false
