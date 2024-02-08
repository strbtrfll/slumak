extends Node

var beatCount = 0
var randNumb = 0
func _ready():
	$BeatTimer.start()
	$BarTimer.start()
	$"Сore/Drums".play()


func _on_timer_timeout():
	beatCount += 1
	
	if beatCount == 16:
		$"Сore/Drums".play()
		$"Сore/Amb".play()
		$"Сore/Melody".play()
		$"Сore/SynthBass".play()
		beatCount = 0


func _on_bar_timer_timeout():
	randNumb += randi_range(1,10)
	random_debug()
	
	random_abmience_pattern()
	random_melody_pattern()
	
	print(randNumb)

func random_debug():
	if randNumb >= 11:
		randNumb = randi_range(1,10)

func random_abmience_pattern():
	if randNumb <= 5:
		$"Сore/Amb".stop()

func random_melody_pattern():
	if randNumb <= 8:
		$"Сore/Melody".stop()

