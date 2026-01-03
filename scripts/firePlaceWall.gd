extends Node2D
@onready var saves = Main
@onready var dia = $main
@onready var dialogBox = dia.dialogBox
@onready var btnRight = dia.btn1
@onready var btnLeft = dia.btn2
@onready var btnDown = dia.btn3
var right = "res://bedroom.tscn"
var left = "res://doorWallBedroom.tscn"
var down = null


# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("room")
	
	if saves.saveVars[saves.cam] == false:
		$Cam.visible = false
	if !saves.saveVars[saves.perfume]:
		$Purfume.visible = false
	if saves.saveVars[saves.fireplace] == "logs":
		$FirePlace.texture = load("res://assets/fireplace with logs.PNG")
	elif saves.saveVars[saves.fireplace] == "lit": showFire()
	if !saves.saveVars[saves.firewood]:
		$Firewood.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_shelf_1_pressed():
	get_tree().change_scene_to_file("res://shelf.tscn")


func _on_firebtn_pressed():
	dia.collect($Firewood, "firewood")
	saves.saveVars[saves.firewood] = false


func _on_firePlacebtn_pressed():
	if dia.inv.size() > 0:
		if saves.saveVars[saves.fireplace] == "empty" && dia.inv[dia.invCurrent] == "firewood":
			$FirePlace.texture = load("res://assets/fireplace with logs.PNG")
			saves.saveVars[saves.fireplace] = "logs"
			dia.use("firewood")
			
		elif saves.saveVars[saves.fireplace] == "logs" && dia.inv[dia.invCurrent] == "matches":
			saves.saveVars[saves.fireplace] = "lit"
			showFire()
			if saves.saveVars[saves.candleLit]:
				dia.use("matches")
		elif saves.saveVars[saves.fireplace] == "lit" && dia.inv[dia.invCurrent] == "cam":
			if dia.inv.has("firePhoto") || saves.saveVars["firePhotoTaken"]:
				pass
			else:
				dia.collect(null, "firePhoto")
			if saves.saveVars[saves.meriPhotoTaken] && saves.saveVars[saves.caraPhotoTaken]:
				dia.use("cam")
			else: 
				dia.use(null)


func showFire():
	$FirePlace/AnimatedSprite2D2.visible = true
	$FirePlace/AnimatedSprite2D2.play("default")
	$FirePlace/AnimatedSprite2D.visible = true
	$FirePlace/AnimatedSprite2D.play("default")


func _on_shelf_2_pressed():
	get_tree().change_scene_to_file("res://jewlerybox.tscn")


func _on_shelf_3_pressed():
	get_tree().change_scene_to_file("res://shelf3.tscn")


func _on_purfume_btn_pressed():
	dia.collect($Purfume, "perfume")
	saves.saveVars[saves.perfume] = false


func _on_statue_pressed():
	get_tree().change_scene_to_file("res://statue.tscn")
