extends CanvasLayer

# time_elapse 已用的时间
var time_elapse := 0

func _on_score_timer_timeout() -> void:
	time_elapse += 1
	$MarginContainer/Score.text = "Time: " + str(time_elapse) +"s"
	var score = $MarginContainer/Score.text
	#To show the time used after game over
	Global.score = score
