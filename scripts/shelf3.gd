extends Node2D
@onready var saves = Main
@onready var music = MusicController

@onready var dia = $main
@onready var btnRight = dia.btn1
@onready var btnLeft = dia.btn2
@onready var btnDown = dia.btn3
var right = null
var left = null
var down = "res://firePlaceWall.tscn"


signal codeFinished


@onready var codebuttons = [$code1, $code2, $code3, $code4]
@onready var labels = [$Label, $Label2, $Label3, $Label4]
var codes = [0, 0, 0, 0]
var code = [3, 1, 0, 6]
# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("inset")
	if saves.saveVars[saves.bookOnStand]:
		$TextureRect/journal.visible = true
	
	for label in labels:
		label.text = "0"
	for button in codebuttons:
		var pressBind = Callable(pressButton)
		pressBind = pressBind.bind(button)
		button.pressed.connect(pressBind)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pressButton(button):
	var index = codebuttons.find(button)
	codes[index] = (codes[index] + 1) % 10
	labels[index].text = str(codes[index])
	
	if codes == code:
		demoFade($Node2D, true)
		await get_tree().create_timer(7).timeout
		demoFade($end, false)

	

func _on_book_stand_pressed():

#
	if saves.saveVars[saves.bookOnStand]:
		get_tree().change_scene_to_file("res://journal.tscn")
	elif dia.inv.size() != 0 &&  dia.inv[dia.invCurrent] == "journal":
		saves.saveVars[saves.bookOnStand] = true
		$TextureRect/journal.visible = true
		dia.use("journal")
	else: 
		dia.caraWrite("I like reading here")
#
#
#
#
#


func _on_box_pressed():
	dia.caraWrite("...")
	dia.caraWrite("I've never opened this box")
		
	
#
func demoFade(node, musicFade):
	var audio = UI.audioPlayer
	node.visible = true
	var color = Color8(0, 0, 0, 0)
	var inc = 0
	audio.volume_db = -60
	audio.stream = load("res://sounds/retentiaDemoComplete.mp3")
	audio.play()
	for i in 51:
		if musicFade:
			MusicController.control.volume_db = MusicController.control.volume_db - 5
			audio.volume_db = audio.volume_db + 1
		inc = inc + 5
		color = Color8(255, 255, 255, inc)
		node.modulate = color
		await get_tree().create_timer(0.01).timeout

