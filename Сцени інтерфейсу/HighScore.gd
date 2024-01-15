extends Label

#Виконується при запуску сцени
func _ready():
	Save.load_high_score()
	text = str(Save.high_score)
