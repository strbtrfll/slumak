extends RigidBody2D

var speed = 10
var timer = 0
var velocity = Vector2(randf_range(-10, 10), randf_range(-10, 10)) * speed
var n = 0


func _process(delta):
	# Двигаем объект в текущем направлении
	if timer > randf_range(60, 250):
		velocity = Vector2(randf_range(-10, 10), randf_range(-10, 10)) * speed
		timer = 0
	linear_velocity = velocity
	timer = timer+1

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and shape_idx == 0:
		n=n+1
		if event.is_pressed() and n>1:
			n=0
			Save.score += 1
			queue_free()
