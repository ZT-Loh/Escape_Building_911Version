extends CanvasLayer

func _ready() -> void:
	$PanelContainer/MarginContainer/VBoxContainer/CenterContainer/VBoxContainer/CenterContainer/MarginContainer/VBoxContainer/TImeUsed.text = "TIme Used: " + str(Global.score) +"s"

func show_game_over():
	self.visible = true

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/background.tscn")


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Start_up.tscn")
