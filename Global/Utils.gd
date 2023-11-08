extends Node

const SAVE_PATH = "res://savegame.bin"

var gameSaved = false

func _ready():
	# Atribuir gameSaved para verdadeiro se o jogo foi carregado com sucesso
	gameSaved = false

func isGameSaved():
	return gameSaved

func saveGame():
	var file = File.new()
	if file.open(SAVE_PATH, File.WRITE) == OK:
		var data = {
			"SPEED": Game.SPEED,
			"points": Game.points,
			"force": Game.force
		}
		var jstr = JSON.print(data)
		file.store_line(jstr)
		file.close()
		gameSaved = true
	else:
		print("Failed to open the file for writing.")
		gameSaved = false
	
func loadGame():
	
	var file = File.new()
	if file.file_exists(SAVE_PATH):
		if file.open(SAVE_PATH, File.READ) == OK:
			var json_data = file.get_as_text()
			var data = JSON.parse(json_data)
			file.close()

			if data != null and typeof(data) == TYPE_DICTIONARY:
				if "SPEED" in data:
					Game.SPEED = data["SPEED"]
				if "points" in data:
					Game.points = data["points"]
				if "force" in data:
					Game.force = data["force"]
