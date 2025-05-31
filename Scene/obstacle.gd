extends Area2D

#Made a signal
signal collision

func _ready() -> void:
	var random := RandomNumberGenerator.new()
	
	#Start Position
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = random.randf_range(1280,width)
	position = Vector2(random_x,480)

func _process(delta: float) -> void:
	var movement = Vector2(Global.Direction,0) * Global.obstacles_speed * delta
	position += movement

func stop_all_towers():
	for tower in get_tree().get_nodes_in_group("Tower"):
			Global.obstacles_speed = 0

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		stop_all_towers()
		#Send out the Signal
		collision.emit()
