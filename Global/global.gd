extends Node

#Global score
var score :int = 0

var obstacles_speed:= 300
var speed_increase = 25
var max_speed = 800
var speed_loop = false
var loop_id = 0
const Direction = -1 

func speed_increase_loop(sec:float) -> void:
	if speed_loop == true:
		return
	speed_loop = true
	loop_id +=1
	var current_loop_id = loop_id
	while obstacles_speed < max_speed:
		var timer = get_tree().create_timer(sec)
		await timer.timeout
		if current_loop_id!= loop_id:
			return
		obstacles_speed = min(obstacles_speed + speed_increase,max_speed)
		print(obstacles_speed)

func start_new_round():
	loop_id +=1
	obstacles_speed = 300
	speed_loop = false
	speed_increase_loop(10)


#Saving File System
var save_path: String = "user://Data.save"
var default_data: Dictionary = {
  "music_volume" : 15,
  "sfx_volume" : 15
}
#Copy Data
var data: Dictionary = default_data.duplicate(true)

func load_data() -> Dictionary:
	if FileAccess.file_exists(save_path):
		var file : FileAccess = FileAccess.open(save_path,FileAccess.READ)
		data = file.get_var(true)
		file.close()
	else:
		save_data()
	
	return data
func save_data() -> void:
	var file: FileAccess = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(data, true)
	file.close()
	
