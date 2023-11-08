extends Node2D

func _ready():
	Utils.loadGame()
	Utils.saveGame()


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
	
func pauseMenu():
	get_tree().change_scene("res://Cenas/InterfaceUsuario.tscn")
	
