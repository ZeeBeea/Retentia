extends Node2D

@onready var dia = $main
@onready var saves = Main
const right = null
const left = null
const down = "res://shelfLivingroom.tscn"

func _ready():
	dia.setup("inset")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bowl_pressed():
	var pigments = ["blood", "blackPigment", "bluePigment", "greenPigment", "whitePigment", "yellowPigment"]
	var powders = ["res://livingroom/shelfs/shelf2/red.PNG", "res://livingroom/shelfs/shelf2/black.PNG","res://livingroom/shelfs/shelf2/blue.PNG", "res://livingroom/shelfs/shelf2/green.PNG", "res://livingroom/shelfs/shelf2/white.PNG", "res://livingroom/shelfs/shelf2/yellow.PNG"]
	
	if dia.inv.size() > 0 && pigments.find(dia.inv[dia.invCurrent]) != -1:
		$Bowl/paste.texture = load(powders[pigments.find(dia.inv[dia.invCurrent])])


func _on_morta_pestle_pressed():
	var items = [$MortarBack/bluebell, $MortarBack/sunflower, $MortarBack/gem]
	var list = ["bluebell", "sunflower", "gem"]
	var pasteColors = ["res://livingroom/shelfs/shelf2/blue.PNG", "res://livingroom/shelfs/shelf2/yellow.PNG", "res://livingroom/shelfs/shelf2/green.PNG", "res://livingroom/shelfs/shelf2/white.PNG"]
	var pigments = ["bluePigment", "yellowPigment", "greenPigment", "whitePigment"]
	
	
	var curr = list.find(dia.inv[dia.invCurrent])
	
	dia.caraWrite(str(curr))
	if dia.inv.size() > 0 && curr != -1:
		saves.saveVars["currentInMortar"] = pigments[curr]
		dia.use(dia.inv[dia.invCurrent])
		items[curr].visible = true
		$AnimationPlayer.play("moveMortar")
		await get_tree().create_timer(1.3).timeout
		items[curr].visible = false
		$MortarBack/paste.visible = true
		$MortarBack/paste.texture = load(pasteColors[curr])

	elif saves.saveVars["currentInMortar"] != null:
		dia.collect($MortarBack/paste, saves.saveVars["currentInMortar"])
		saves.saveVars["currentInMortar"] = null
