extends RigidBody2D

var speed = 2000
var timer = 0
var velocity = Vector2(randf_range(-10, 10), randf_range(-10, 10)) * speed


#Кожен кадр/рух
func _process(delta):
	# Двигаем объект в текущем направлении
	if timer > randf_range(60, 250):
		velocity = Vector2(randf_range(-10, 10), randf_range(-10, 10)) * speed 
		timer = 0
	linear_velocity = velocity * delta
	timer = timer+1

#Клік
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and shape_idx == 0:
		if event.is_pressed():
			Save.score += 1
			death()

#Відштовхування
func _on_body_entered(body):
	velocity = Vector2(randf_range(-10, 10), randf_range(-10, 10)) * 2000
	timer = 0

#Таймер смерті
func _on_death_timer_timeout():
	queue_free()

#Анімація смерті
func death():
	$AnimatedSprite2D.play("Death")
	$DeathTimer.start()
	$AnimationPlayer.play("Blue_Death")
	$CollisionShape2D.disabled = true
	freeze = true
