extends Node

var score = 0
var high_score = 0


func load_high_score():
	var file = FileAccess.open("user://high-score.txt", FileAccess.READ)
	high_score = file.get_as_text(true).to_int()

func save_high_score():
	var file = FileAccess.open("user://high-score.txt", FileAccess.WRITE)
	file.store_string(str(high_score))
