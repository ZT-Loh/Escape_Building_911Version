extends CanvasLayer

@onready var setting_menu = $Setting

func _process(_delta: float) -> void:
	if setting_menu.visible:
		$Touch_Start_Button.process_mode =Node.PROCESS_MODE_DISABLED
	
	else:
		$Touch_Start_Button.process_mode = Node.PROCESS_MODE_INHERIT
	

func _on_touch_start_button_pressed() -> void:
	get_tree().change_scene_to_file.call_deferred("res://Scene/background.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_setting_pressed() -> void:
	setting_menu.show()
