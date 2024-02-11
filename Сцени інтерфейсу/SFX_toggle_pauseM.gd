extends TextureButton

var sfx_bus = AudioServer.get_bus_index("SFX")
var global_data = null

func _ready():
	# Пытаемся получить синглтон GlobalData
	global_data = get_node("/root/GlobalData")
	if global_data == null:
		# Если не найден, создаем новый экземпляр GlobalData в качестве синглтона
		global_data = preload("res://GlobalData.gd").new()
		global_data.name = "GlobalData"
		get_tree().root.add_child(global_data)

	update_button_texture()

func _on_pressed():
	global_data.isAudioMuted = not global_data.isAudioMuted
	AudioServer.set_bus_mute(sfx_bus, global_data.isAudioMuted)
	update_button_texture()
	play_UI()

func update_button_texture():
	if global_data.isAudioMuted:
		self.texture_normal = load("res://art/Audio/off.png")
	else:
		self.texture_normal = load("res://art/Audio/on.png")

func play_UI():
	if global_data.isMusicMuted:
		$"../../../UIAudio/BadClick".play()
	else:
		$"../../../UIAudio/Click".play()
