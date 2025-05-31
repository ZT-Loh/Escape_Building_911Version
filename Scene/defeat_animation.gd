extends Node2D

@onready var skip_button = $Skip_Button
@onready var skip_text = $CanvasLayer/PanelContainer/MarginContainer/Skip_Text

func _ready() -> void:
	var platform = OS.get_name()
	if platform == "Android" or platform == "iOS":
		skip_text.text = "Press The Screen To Skip The Animation"
	else:
		skip_button.hide()

func _on_animated_sprite_2d_animation_finished() -> void:
	get_tree().change_scene_to_file.call_deferred("res://Scene/game_over_screen.tscn")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Shoot"):
		get_tree().change_scene_to_file.call_deferred("res://Scene/game_over_screen.tscn")

func _on_touch_screen_button_pressed() -> void:
	get_tree().change_scene_to_file.call_deferred("res://Scene/game_over_screen.tscn")
