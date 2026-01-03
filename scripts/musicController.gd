extends AudioStreamPlayer2D

@onready var saves = Main
@onready var control = $"."
# Called when the node enters the scene tree for the first time.
func _ready():
	$".".volume_db = 1
	$".".play()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	pass


func updateVolume():
	if saves.saveVars[saves.globalVolume] != null && saves.saveVars[saves.muted] == false:
		$".".volume_db = (saves.saveVars[saves.globalVolume] * 15) - 15
	elif saves.saveVars[saves.globalVolume]:
		$".".volume_db = -80
