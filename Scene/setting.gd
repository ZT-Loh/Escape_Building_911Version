extends Node2D
@onready var music_slider =$Panel/Panel/VBoxContainer/Music_Volume
@onready var sfx_slider = $Panel/Panel/VBoxContainer/MarginContainer/VBoxContainer2/SFX_Volume

func _ready() -> void:
	Global.load_data()
	update_music_volume()
	update_sfx_volume()
	print(Global.load_data())

func update_music_volume() -> void:
	music_slider.value = Global.data["music_volume"]

func update_sfx_volume() -> void:
	sfx_slider.value = Global.data["sfx_volume"]

#Close func
func _on_save_quit_pressed() -> void:
	$".".hide()
	
# Slider Music Volume
func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),value)
	Global.data.music_volume = value
	Global.save_data()

#Slider SFX Volume
func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),value)
	Global.data.sfx_volume = value
	Global.save_data()
