extends Node2D
@onready var dia = $main
var right = null
var left = null
var down = "res://firePlaceWall.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	dia.setup("inset")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	

func _on_statue_pressed():
	$AnimationPlayer.play("drop")
	await get_tree().create_timer(0.1).timeout
	$TextureRect/Sprite2D.visible = false
	$TextureRect/StatueBottom.visible = true
	$AnimationPlayer.play("dropBottom")
