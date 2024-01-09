extends Node2D

@export var slime_scene: PackedScene
@export var orange: PackedScene

var score = 0
var kilkist = 0
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
	print("pipi")
	kilkist += 1 
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
	print("pipi")
	kilkist += 1 
#Система балів
func _on_child_exiting_tree(node):
	if node:
		score += 1
		kilkist -= 1 
		$HUD/Score.text = str(score)
func _process(delta):
	if kilkist >  100:
		get_tree().change_scene_to_file("res://Сцени інтерфейсу/Menu.tscn")
