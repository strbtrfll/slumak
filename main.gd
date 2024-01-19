extends Node2D

class_name Main

@export var slime_scene: PackedScene
@export var orange: PackedScene
@export var black: PackedScene


var BlackRandomSpawn = randf_range(0, 60)
var blacktime = 0
var amount = 0 #кількість cлимаків


#Виконується при запуску сцени
func _ready():
	Save.score = 0

#Cпавн зеленого
func _on_spawn_timer_timeout():
	
	var slime = slime_scene.instantiate()
	
	#Рандомна локація на "MobPath"
	var slime_spawn_location = get_node("SlimePath/SlimeSpawnLocation")
	slime_spawn_location.progress_ratio = randf()
	
	
	#Позиція ерпендикулярна до "MobPath"
	var direction = slime_spawn_location.rotation + PI / 2
	
	#Рандомна позиція слимака
	slime.position = slime_spawn_location.position
	
	
	#Ще більше рандому
	direction += randf_range(-PI / 4 , PI / 4)
	slime.rotation = direction
	
	add_child(slime)
	amount += 1 
	#Якщо, комусь цікаво чому тут числа ПІ, це тому що...
	#Готод не вміє в градуси і замість них використовує радіани
	#А я як самий великий математик в дішу не їбу що це. Тому мені довелося переводити радіани в градуси.

#Спавн броньованого
func _on_spawn_orange_timeout():
	var orangeslime = orange.instantiate()
	var slime_spawn_location2 = get_node("SlimePath/SlimeSpawnLocation")
	slime_spawn_location2.progress_ratio = randf()
	var direction2 = slime_spawn_location2.rotation + PI / 2
	orangeslime.position = slime_spawn_location2.position
	direction2 += randf_range(-PI / 4 , PI / 4)
	orangeslime.rotation = direction2
	add_child(orangeslime)
	
	amount += 1 

#Спавн чорного
func _on_spawn_black_timeout():
	blacktime +=1
	if blacktime > BlackRandomSpawn:
		var blackslime = black.instantiate()
		var slime_spawn_location3 = get_node("SlimePath/SlimeSpawnLocation")
		slime_spawn_location3.progress_ratio = randf()
		var direction3 = slime_spawn_location3.rotation + PI / 2
		blackslime.position = slime_spawn_location3.position
		direction3 += randf_range(-PI / 4 , PI / 4)
		blackslime.rotation = direction3
		add_child(blackslime)
		BlackRandomSpawn = randf_range(0, 60)
		blacktime = 0
		amount += 1 

#Система балів
func _on_child_exiting_tree(node):
	if node:
		amount -= 1 
		$HUD/Score.text = str(Save.score)

#Кінець гри
func game_over():
	if amount >  20:
		get_tree().change_scene_to_file("res://Сцени інтерфейсу/Menu.tscn")
	if Save.high_score < Save.score:
		Save.high_score = Save.score
		Save.save_high_score()
		print("pipi")

#Виконується кожен кадр
func _process(delta):
	game_over()
	speedup_1()
	speedup_2()
	speedup_3()
	speedup_4()
	speedup_5()

#Пришвидшення гри
func speedup_1():
	if Save.score >= 10:
		$SpawnTimer.wait_time = 1.7
		$SpawnOrange.wait_time = 4
func speedup_2():
	if Save.score >= 30:
		$SpawnTimer.wait_time = 1.5
		$SpawnOrange.wait_time = 3
		BlackRandomSpawn = randf_range(0, 50)
func speedup_3():
	if Save.score >= 80:
		$SpawnTimer.wait_time = 1
		$SpawnOrange.wait_time = 2.5
		BlackRandomSpawn = randf_range(0, 45)
func speedup_4():
	if Save.score >= 150:
		$SpawnTimer.wait_time = 0.75
		$SpawnOrange.wait_time = 2
		BlackRandomSpawn = randf_range(0, 40)
func speedup_5():
	if Save.score >= 300:
		$SpawnTimer.wait_time = 0.5
		$SpawnOrange.wait_time = 2
		BlackRandomSpawn = randf_range(0, 35)

#vizav pause menu
signal toggle_game_paused(is_paused : bool)

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused #???
		emit_signal("toggle_game_paused", game_paused)


# Pause on Esc
#func _input(event : InputEvent):
#	if(event.is_action_pressed("ui_cancel")):
#		game_paused = !game_paused
		

func _on_pause_button_pressed():
	game_paused = true
