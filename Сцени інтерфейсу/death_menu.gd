extends Control

@export var main: Main

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/VBoxContainer/Score.text = $Panel/VBoxContainer/Score.text % [str(Save.high_score), Save.score]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_restart_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://Сцени інтерфейсу/Menu.tscn")



