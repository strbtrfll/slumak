extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")#указать путь к сцене(перетащить файл сцены в скобки())

func _on_option_button_pressed():
	pass # Replace with function body.

func _on_quit_button_pressed():
	get_tree().quit()
