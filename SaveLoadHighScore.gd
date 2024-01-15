extends Node
#Всі перемінні, функції, тд. з цього срипта у загальномому доступі.
#Викликаються Save.
#Наприклад Save.score або Save.load_high_score()

var score = 0
var high_score = 0

#Завантажує найкращий результат
func load_high_score():
	var file = FileAccess.open("user://high-score.txt", FileAccess.READ)
	high_score = file.get_as_text(true).to_int()

#Зберігає найкращий результат
func save_high_score():
	var file = FileAccess.open("user://high-score.txt", FileAccess.WRITE)
	file.store_string(str(high_score))
