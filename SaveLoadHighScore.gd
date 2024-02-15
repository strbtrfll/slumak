extends Node
#Всі перемінні, функції, тд. з цього срипта у загальномому доступі.
#Викликаються Save.
#Наприклад Save.score або Save.load_high_score()

var score = 0
var high_score = 0
var saved_Score = "user://high-score.txt"
var file = FileAccess.new


#Завантажує найкращий результат
func load_high_score():
	if not FileAccess.file_exists(saved_Score) == true:
		save_high_score()
	file = FileAccess.open(saved_Score, FileAccess.READ)
	high_score = file.get_as_text(true).to_int()


#Зберігає найкращий результат
func save_high_score():
	file = FileAccess.open(saved_Score, FileAccess.WRITE)
	file.store_string(str(high_score))
	print("saved")
