extends Control

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()


func toggle():
	visible = !visible
	get_tree().paused = visible

func _ready():
	$VBoxContainer/StartButton.grab_focus()
	

func _on_start_button_pressed():
	$UIAudio/Click.play()
	$UIAudio/StartTimer.start()
	#toggle()

func _on_option_button_pressed():
	$UIAudio/Click.play()
	show_and_hide($Options, $VBoxContainer)

func show_and_hide(first, second):
	first.show()
	second.hide()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_back_button_pressed():
	$UIAudio/BadClick.play()
	show_and_hide($VBoxContainer, $Options)

func _on_master_value_changed(value):
	volume(0, value)

func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)

func _on_music_value_changed(value):
	volume(1, value)

func _on_sfx_value_changed(value):
	volume(2, value)


func _on_start_timer_timeout():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_sfx_pressed():
	pass # Replace with function body.

func _on_main_menu_theme_finished():
	$MainMenuTheme.play()
