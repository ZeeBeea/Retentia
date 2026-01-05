extends Node2D

@onready var saves = Main
@onready var dia = $main
@onready var dialogBox = dia.dialogBox

var right = null
var left = null
var down = "res://firePlaceWall.tscn"

@onready var rightbtn = $arrowright
@onready var leftbtn = $arrowleft
var currentPage = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("inset")
	if saves.saveVars[saves.caraUndressJournal]:
		$pageBG/photoCaraUndress.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currentPage == 1:
		if saves.saveVars[saves.caraPhotoInJournal]:
			$pageBG/photoCara.visible = true
		$pageBG/photomeri.visible = false
		$pageBG/photofire.visible = false
	elif currentPage == 2:
		$pageBG/photoCara.visible = false
		if saves.saveVars[saves.firePhotoInJournal]:
			$pageBG/photofire.visible = true
		if saves.saveVars[saves.meriPhotoInJournal]:
			$pageBG/photomeri.visible = true


func _on_button_pressed():
	#The right button
	$pageBG/text.texture = load("res://assets/book/page2/page2text.PNG")
	$pageBG/caraBtn.visible = false
	$pageBG/meriBtn.visible = true
	$pageBG/firePhoto.visible = true
	
	rightbtn.visible = false
	leftbtn.visible = true
	currentPage = currentPage + 1


func _on_button_2_pressed():
	#the Left button
	$pageBG/text.texture = load("res://assets/book/PAGE1/page1text.PNG")
	$pageBG/caraBtn.visible = true
	$pageBG/meriBtn.visible = false
	$pageBG/firePhoto.visible = false
	rightbtn.visible = true
	leftbtn.visible = false
	currentPage = currentPage - 1


func _on_cara_btn_pressed():
	if currentPage == 1:
		
		if dia.inv.size() > 0:
			if  dia.inv[dia.invCurrent] == "caraPhoto":
				if !saves.saveVars["caraUndressJournal"]:
					dia.use("caraPhoto")
					saves.saveVars[saves.caraPhotoInJournal] = true
				else: dia.caraWrite("I already have a selfie.")
			elif  dia.inv[dia.invCurrent] == "caraUndressedPhoto":
				if !saves.saveVars[saves.caraPhotoInJournal]:
					$pageBG/photoCaraUndress.visible = true
					dia.use("caraUndressedPhoto")
					saves.saveVars["caraUndressJounral"] = true
				else: dia.caraWrite("I already have a selfie.")


func _on_meri_btn_pressed():
	if currentPage == 2:
		if dia.inv.size() > 0 && dia.inv[dia.invCurrent] == "meriPhoto":
			saves.saveVars[saves.meriPhotoInJournal] = true
			dia.use("meriPhoto")




func _on_fire_btn_pressed():
	if currentPage == 2:
		if dia.inv.size() > 0 && dia.inv[dia.invCurrent] == "firePhoto":
			saves.saveVars[saves.firePhotoInJournal] = true
			dia.use("firePhoto")
