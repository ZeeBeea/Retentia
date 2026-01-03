extends Node2D


@onready var saves = Main
@onready var dia = $main
@onready var dialogBox = dia.dialogBox
@onready var dialog = dia.text.text
@onready var btnRight = dia.btn1
@onready var btnLeft = dia.btn2
@onready var btnDown = dia.btn3
const right = "res://doorLivingroom.tscn"
const left = "res://shelfLivingroom.tscn"
const down = null

# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("room")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_painting_button_pressed():
	
	
	
	if dia.inv[dia.invCurrent] ==  "canvas" && !saves.saveVars["canvasInPainting"]:
		$PaintingWallLivingRoom/PaintLayer5.visible = true
		saves.saveVars["canvasInPainting"] = true
	elif saves.saveVars["canvasInPainting"]:
		var item
		
		var paintBrush = ["yellowPaintbrush", "whitePaintbrush", "redPaintbrush", "greenPaintbrush", "bluePaintbrush", "blackPaintbrush"]
		var paintings = [$PaintingWallLivingRoom/PaintLayer5/Yellow, $PaintingWallLivingRoom/PaintLayer5/White2, $PaintingWallLivingRoom/PaintLayer5/Red2, $PaintingWallLivingRoom/PaintLayer5/Gree, $PaintingWallLivingRoom/PaintLayer5/Blue2,$PaintingWallLivingRoom/PaintLayer5/Black2]
		
		if dia.inv.size != 0:
			item = dia.inv[dia.invCurrent]
			paintings[paintBrush.find(item)].visible = true

func _on_pallet_pressed():
	var item

	var paints = ["yellowPaint", "whitePaint", "redPaint", "greenPaint", "bluePaint", "blackPaint" ]
	var paintPallets = [$PaintingWallLivingRoom/Pallet/Yellpw, $PaintingWallLivingRoom/Pallet/White, $PaintingWallLivingRoom/Pallet/Red, $PaintingWallLivingRoom/Pallet/Green, $PaintingWallLivingRoom/Pallet/Blue, $PaintingWallLivingRoom/Pallet/Black]
	if dia.inv.size != 0:
		item = dia.inv[dia.invCurrent]
		paintPallets[paints.find(item)].visible = true
	
	
	var count = 0
	for paint in paints:
		if paintPallets[paint].visible:
			count = count + 1
		else:
			pass
	if count == 6:
		$PaintingWallLivingRoom/Pallet/Button.visible = false

func _on_sunflowerbtn_pressed():
	dia.collect($Sunflower, "sunflower")
	



func _on_bluebellbtn_pressed():
	dia.collect($Bluebell, "bluebell")
	



func _on_candlebtn_pressed():
	if dia.inv[dia.invCurrent] == "matches" && !saves.saveVars["candleLitLivingroom"]:
		$Candle.texture = load("res://livingroom/paintingWall/lit.PNG")
		$Candle/flame.visible = true
		dia.use("matches")
	elif dia.inv[dia.invCurrent] == "spoon" && saves.saveVars["candleLitLivingroom"]:
		$Spoon.visible = true
		await get_tree().create_timer(1).timeout
		$Spoon.visible = false
		dia.use("spoon")
		dia.collect(null, "blackPigment")
	
		
