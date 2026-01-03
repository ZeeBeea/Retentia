extends Node2D




@onready var saves = Main
@onready var dia = $main
@onready var dialogBox = dia.dialogBox
@onready var dialog = dia.text.text
@onready var btnRight = dia.btn1
@onready var btnLeft = dia.btn2
@onready var btnDown = dia.btn3
const right = "res://mirrorBedroom.tscn"
const left = "res://firePlaceWall.tscn"
const down = null


var backgrounds = {"Open": "res://backgrounds/bedwall.PNG", "Closed": "res://backgrounds/openCurtain.png", "Torn": "res://backgrounds/tornPainting.png"}

@onready var bg = $TextureRect

func _ready():
	dia.setup("room")
	
	bg.texture = load(backgrounds[saves.saveVars[saves.CurtainState]])
	if saves.saveVars[saves.bonInside]:
		$bon.visible = true
	if saves.saveVars[saves.bonEaten]:
		$bon.play("blood")
	if saves.saveVars[saves.meriInside]:
		$meri.visible = true
	
	
		


func _physics_process(delta):
	pass
	




func _on_cabinet_pressed():
	get_tree().change_scene_to_file("res://closet.tscn")


func _on_curtain_pressed():
	if saves.saveVars[saves.CurtainState] == "Closed":
		saves.saveVars[saves.CurtainState] = "Open"
		dia.caraWrite("What a nice painting")
		bg.texture = load("res://backgrounds/bedwall.PNG")
	elif saves.saveVars[saves.CurtainState] == "Open":
		if dia.inv.size() != 0 &&  dia.inv[dia.invCurrent] == "knife":
			saves.saveVars[saves.CurtainState] = "Torn"
			bg.texture = load("res://backgrounds/tornPainting.png")
			$TextureRect2.visible = true
		else: dia.caraWrite("Theres a lump behind the canvas")
	


func _on_bed_pressed():
	if !saves.saveVars[saves.meriInside]:
		dia.caraWrite("The bedspread is nice")
	elif saves.saveVars[saves.meriInside]:
		_on_meri_btn_pressed()
	
	

	


func _on_key_pressed():
	if saves.saveVars[saves.CurtainState] == "Torn":
		dia.collect($TextureRect2, "key")


func _on_meri_btn_pressed():
	if dia.inv.size() > 0:
		if dia.inv[dia.invCurrent] == "perfume":
			dia.use("perfume")
			saves.saveVars[saves.meriPerfume] = true
		elif dia.inv[dia.invCurrent] == "makeup":
			dia.use("makeup")
			saves.saveVars[saves.meriMakeup] = true
	$meri.play("talk")
	if !saves.saveVars[saves.meriPhotoTaken]:
		dia.meriWrite("Can you take my photo?")

		
		await get_tree().create_timer(1.25).timeout
		if !saves.saveVars[saves.meriMakeup] && !saves.saveVars[saves.meriPerfume]:
			dia.meriWrite("I don't have my makeup or perfume on")
		elif !saves.saveVars[saves.meriMakeup] && saves.saveVars[saves.meriPerfume]:
			dia.meriWrite("I don't have my makeup on")
		elif saves.saveVars[saves.meriMakeup] && !saves.saveVars[saves.meriPerfume]:
			dia.meriWrite("I don't have any perfume")
		elif !saves.saveVars[saves.meriPhotoTaken]:
			if dia.inv.size() > 0 && dia.inv[dia.invCurrent] == "cam" && !saves.saveVars[saves.meriPhotoTaken]:
				dia.collect(null, "meriPhoto")
				saves.saveVars[saves.meriPhotoTaken] = true
				
				if saves.saveVars[saves.firePhotoTaken] && saves.saveVars[saves.caraPhotoTaken]:
					dia.use("cam")
		else: 
			dia.meriWrite("Bon is at the door")
	else:
		dia.meriWrite("There are three lovers, and six fangs")
	await get_tree().create_timer(1.0).timeout
	$meri.play("default")


func _on_bon_btn_pressed():
	if dia.inv.size() > 0 && dia.inv[dia.invCurrent] == "mouse":
		dia.use("mouse")
		saves.saveVars[saves.bonEaten] = true
		$bon.play("blood")
	elif !saves.saveVars[saves.bonEaten]:

		$bon.play("talking")
		dia.bonWrite("I'm hungry")
		await get_tree().create_timer(1.0).timeout
		$bon.play("default")

	else:

		$bon.play("talking")
		dia.bonWrite("No sunshine and one manor")
		await get_tree().create_timer(1.0).timeout
		$bon.play("blood")

