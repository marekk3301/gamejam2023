extends AnimatedSprite

var time = 0
var animation_stage = 0

func _ready():
	# Start the timer
	add_child(Timer.new())
	get_child(0).connect("timeout", self, "_on_Timer_timeout")
	get_child(0).start(1)

func _on_Timer_timeout():
	animation_stage += 1
	time = 2
	if animation_stage == 1:
		$".".play("stage1")
	elif animation_stage ==2:
		$".".play("stage2")
	else:
		pass
