extends Node

var beatCount = 0
var randNumb = 0


func _ready():
	$BeatTimer.start()
	$BarTimer.start()
	$Opening.play()

#Кожен біт
func _on_timer_timeout():
	beatCount += 1
	
	if beatCount == 16:
		$"Сore/SynthBass".play()
		$"Сore/Drums".play()
		$"Сore/Amb".play()
		$"Сore/Melody".play()
		beatCount = 0

#Конежен бар
func _on_bar_timer_timeout():
	randNumb = randi_range(1,10)
	
	random_abmience_pattern()
	random_melody_pattern()
	bridge()


func random_abmience_pattern():
	if randNumb <= 4:
		$"Сore/Amb".stop()
func random_melody_pattern():
	if randNumb >= 5:
		$"Сore/Melody".stop()
func bridge():
	if randNumb == 10:
		$"Сore/Drums".stop()
		$"Сore/Melody".stop()
		$"Сore/Amb".stop()


