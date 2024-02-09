extends Control

@export var main : Main

@onready var Buton = $"../../PauseButton"

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
	Buton.show()


func _on_quit_button_pressed():
	$QuitTimer.start()
	$UIAudio/BadClick.play()

#Таймер виходу
func _on_quit_timer_timeout():
	main.game_paused = false
	get_tree().change_scene_to_file("res://Сцени інтерфейсу/Menu.tscn")
