extends RigidBody2D

var speed = 2000
var timer = 0
var velocity = Vector2(randf_range(-10, 10), randf_range(-10, 10)) * speed

#Початок гри
func _ready():
	$Move.play()

#Кожен кадр/рух
func _process(delta):
	# Двигаем объект в текущем направлении
	linear_velocity = velocity * delta

#Клік
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and shape_idx == 0:
		if event.is_pressed():
			Save.score += 1
			death()

#Відштовхування
func _on_body_entered(body):
	velocity = Vector2(randf_range(-10, 10), randf_range(-10, 10)) * speed
	if body is StaticBody2D:
		linear_velocity = -linear_velocity

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
	$Death.play()

#SFX
func audio_event_move():
	if $AnimatedSprite2D.frame == 0:
		$Move.play()
func _on_animated_sprite_2d_frame_changed():
	audio_event_move()
