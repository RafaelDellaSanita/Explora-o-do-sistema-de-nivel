extends Control
	
	
func _ready():
	get_node("AnimatedSprite").play("Personagem")
	block_button()
	
	
func _on_Resume_pressed():
	Utils.saveGame()
	Utils.loadGame()
	get_tree().change_scene("res://Cenas/World.tscn")
	
	
func _on_Quit_pressed():
	Utils.saveGame()
	Utils.loadGame()
	if Utils.isGameSaved():
		get_tree().quit()
	


func _on_Controls_pressed():
	get_tree().change_scene("res://Cenas/Control.tscn")

func _on_ButtonFMinus_pressed():
	if Game.force >= 200:
		Game.force -= 100
		Game.points += 100
		block_button()

func _on_ButtonFPlus_pressed():
	if Game.points >= 100:
		Game.force += 100
		Game.points -= 100
		block_button()

func _on_ButtonSMinus_pressed():
	if Game.SPEED >= 200:
		Game.SPEED -= 100
		Game.points += 100
		block_button()

func _on_ButtonSPlus_pressed():
	if Game.points >= 100:
		Game.SPEED += 100
		Game.points -= 100
		block_button()

func block_button():
	var buttons = [
		$Hud2/ButtonFPlus,
		$Hud2/ButtonSPlus
	]
	
	for i in range(buttons.size()):
		if Game.points == 0:
			buttons[i].disabled = true
		else:
			buttons[i].disabled = false
