extends Node

@export var can_toggle_pause: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("menu_pause"):
		if !get_tree().paused:
			pause()
		else:
			resume()

func pause():
	if can_toggle_pause:
		get_tree().set_deferred("paused", true)

func resume():
	if can_toggle_pause:
		get_tree().set_deferred("paused", false)

