extends TextureButton

var sfx_bus = AudioServer.get_bus_index("SFX")


func _on_pressed():
	AudioServer.set_bus_mute(sfx_bus, not AudioServer.is_bus_mute(sfx_bus))
