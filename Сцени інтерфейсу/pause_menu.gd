extends Control

@export var main : Main

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	main.connect("toggle_game_paused", _on_main_toggle_game_paused)

func _on_main_toggle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()


func _on_resume_button_pressed():
	main.game_paused = false


func _on_quit_button_pressed():
	main.game_paused = false
	get_tree().change_scene_to_file("res://Сцени інтерфейсу/Menu.tscn")
