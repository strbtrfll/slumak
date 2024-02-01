extends Control

@export var main: Main

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/Score.text = $VBoxContainer/Score.text % [str(Save.high_score), Save.score]



func _on_restart_button_pressed():
	$UIAudio/RestartTimer.start()
	$UIAudio/Click.play()

func _on_quit_button_pressed():
	$UIAudio/QuitTimer.start()
	$UIAudio/BadClick.play()


func _on_restart_timer_timeout():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_quit_timer_timeout():
	get_tree().change_scene_to_file("res://Сцени інтерфейсу/Menu.tscn")
