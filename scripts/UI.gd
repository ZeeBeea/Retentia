extends Node2D

var saves = Main
@onready var btn1 = $changeSceneButton
@onready var btn2 = $changeSceneButton2
@onready var btn3 = $changeSceneButton3
@onready var audioPlayer = $AudioStreamPlayer
@onready var dialogBox = $DialogBox
@onready var text = $DialogBox/Label
var inv = saves.invGlobal
var invCurrent = saves.invCurrentGlobal
# Called when the node enters the scene tree for the first time.
func _ready():
	if inv.size() > 0:
		var currentOb = inv[invCurrent]
		$TextureRect.texture = load(saves.objectDicts[currentOb])
	elif inv.size() == 0:
		$TextureRect.texture = null
	
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func updateArrayText():
	if inv.size() == 0:
		$TextureRect.texture = null
	elif inv.size() > 0:
		var currentOb = inv[invCurrent]
		$TextureRect.texture = load(saves.objectDicts[currentOb])

func _on_rightBtn_pressed():
	var currentScene = get_tree().current_scene
	if currentScene.right != null:
		get_tree().change_scene_to_file(currentScene.right)
	updateArrayText()


func _on_leftBtn_pressed():
	var currentScene = get_tree().current_scene
	if currentScene.left != null:
		get_tree().change_scene_to_file(currentScene.left)
	updateArrayText()


func _on_downBtn_pressed():
	var currentScene = get_tree().current_scene
	if currentScene.down != null:
		get_tree().change_scene_to_file(currentScene.down)
	updateArrayText()

func _input(event):
	if event is InputEventKey:
		if event.pressed && inv.size() > 0:
			if event.keycode == KEY_RIGHT:
				invCurrent = invCurrent+1
				invCurrent = invCurrent % inv.size()
			elif event.keycode == KEY_LEFT:
				invCurrent = invCurrent-1
				invCurrent = invCurrent % inv.size() 
				if invCurrent < 0:
					invCurrent = invCurrent + inv.size()
		if event.pressed && event.keycode == KEY_SPACE:
			if $Node2D.visible == false:
				$Node2D.visible = true
			elif $Node2D.visible == true:
				$Node2D.visible = false
		updateArrayText()

func dialogWrite(write):
	dialogBox.visible = true
	text.text = write
	await get_tree().create_timer(1.0).timeout
	dialogBox.visible = false
	

func caraWrite(write):
	$DialogBox.color = saves.caraColor
	$DialogBox/TextDeco.texture = load("res://UIFiles/caraDia.png")
	dialogWrite(write)
	
	
func meriWrite(write):
	$DialogBox.color = saves.meriColor
	$DialogBox/TextDeco.texture = load("res://UIFiles/meriDia.PNG")
	dialogWrite(write)
	


func bonWrite(write):
	$DialogBox.color = saves.bonColor
	$DialogBox/TextDeco.texture = load("res://UIFiles/bonDia.PNG")
	dialogWrite(write)


func collect(item, itemName):
	var currentScene = get_tree().current_scene
	if item != null:
		item.visible = false
	inv.append(itemName)
	$AudioStreamPlayer.stream = load("res://sounds/old-radio-button-click-97549.mp3")
	$AudioStreamPlayer.play()
	saves.invGlobal = inv
	updateArrayText()
	
func use(itemName):
	if invCurrent != 0:
		invCurrent = invCurrent - 1
	if itemName != null:
		inv.erase(itemName)
	$AudioStreamPlayer.stream = load("res://sounds/stick-hitting-a-dreadlock-small-thud-83297.mp3")
	$AudioStreamPlayer.play()
	updateArrayText()
	

func setup(type):
	var currentScene = get_tree().current_scene
	dialogBox.visible = false
	$TextureRect.visible = true
	if type == "room":
		$changeSceneButton.visible = true
		$changeSceneButton2.visible = true
		$changeSceneButton3.visible = false
		
	elif type == "inset":
		$changeSceneButton.visible = false
		$changeSceneButton2.visible = false
		$changeSceneButton3.visible = true


func _on_continue_pressed():
	$Node2D.visible = false
	$Node2D.visible = false
