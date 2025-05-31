extends CharacterBody2D
const GRAVITY = 500
@onready var touch_button = $"../Touch_up_Button"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position= Vector2(50,550)
	var platform = OS.get_name()
	if platform == "Android" or platform == "iOS":
		pass
	else:
		touch_button.hide()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#Press Up to Jump
	if Input.is_action_just_pressed("ui_up"):
		velocity.y += -200
		move_and_slide()

	#Press W to jump
	if Input.is_action_just_pressed("Jump"):
		velocity.y += -200
		move_and_slide()
	
	if is_on_floor():
		pass
	else:
		velocity.y += GRAVITY * delta
	move_and_slide()
