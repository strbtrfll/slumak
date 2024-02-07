extends RigidBody2D

var speed = 10
var timer = 0
var velocity = Vector2(randf_range(-10, 10), randf_range(-10, 10)) * speed
var n = 0

#Початок гри
func _ready():
	$Move.play()

#Кожен кадр/рух
func _process(delta):
	# Двигаем объект в текущем направлении
	if timer > randf_range(60, 250):
		velocity = Vector2(randf_range(-10, 10), randf_range(-10, 10)) * speed
		timer = 0
	linear_velocity = velocity 
	timer = timer+1

#Клік
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and shape_idx == 0:
		n=n+1
		if event.is_pressed() and n>1:
			n=0
			Save.score += 1
			death()

#Відштовхування
func _on_body_entered(body):
	velocity = Vector2(randf_range(-10, 10), randf_range(-10, 10)) * 12
	timer = 0
	if body is StaticBody2D:
		linear_velocity = -linear_velocity

#Таймер смерті
func _on_death_timer_timeout():
	queue_free()

#Анімація смерті
func death():
	$AnimatedSprite2D.play("Death")
	$DeathTimer.start()
	$AnimationPlayer.play("Orange_death")
	$CollisionShape2D.disabled = true
	freeze = true
	$Death.play()

#SFX
func audio_event_move():
	if $AnimatedSprite2D.frame == 0:
		$Move.play()
func _on_animated_sprite_2d_frame_changed():
	audio_event_move()
