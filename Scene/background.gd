extends Node2D


#Create the scene
var obstacle_scene: PackedScene = load("res://Scene/obstacle.tscn")
var obstacle2_scene: PackedScene = load("res://Scene/twin_tower_2.tscn")

#Random Number Generator
var rng = RandomNumberGenerator.new()

#Pause button
var pause = false

#print out the scene instantaneous
func _on_obstacle_timer_timeout() -> void:
	# Create an instance
	var obstacle = obstacle_scene.instantiate()
	var obstacle2 = obstacle2_scene.instantiate()
	
#random choose one type of the obstacle
# Attach the node to the scene tree
	var ran:int = rng.randi_range(0,1)
	if ran == 1:
		$Obstacles.add_child(obstacle)
	else:
		$Obstacles.add_child(obstacle2)

#Connect the signal
	obstacle.connect("collision", tower_collision)
	obstacle2.connect("collision",tower_collision)

func tower_collision():
	get_tree().change_scene_to_file.call_deferred("res://Scene/defeat_animation.tscn")

func _ready() -> void:
	Global.start_new_round()
	$Background_Song.play()
	$SFX_Effect.play()

#Pause button
func _on_pause_button_pressed() -> void:
	if pause == false:
		get_tree().paused = true
		pause = true
		$Pause_button.texture_normal = load("res://Google Dino Run 911 Vers/Pause_button1.png")
	else:
		get_tree().paused = false
		pause = false
		$Pause_button.texture_normal = load("res://Google Dino Run 911 Vers/Pause_button2.png")

#Audio mute button
var audio_mute = false

func _on_audio_button_pressed() -> void:
	var master_bus_index = AudioServer.get_bus_index("Master")
	
	if audio_mute == false:
		AudioServer.set_bus_mute(master_bus_index, true)
		$Audio_button.texture_normal = load("res://Google Dino Run 911 Vers/muted.png")
		audio_mute = true
	else:
		AudioServer.set_bus_mute(master_bus_index, false)
		$Audio_button.texture_normal = load("res://Google Dino Run 911 Vers/unmuted.png")
		audio_mute= false
