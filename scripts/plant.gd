extends AnimatedSprite

var time = 5
var animation_stage = 0
var growthRate = 0

func _ready():
	pass

func nextGrowthStage():
	animation_stage += 1
	time = 5
	if animation_stage == 1:
		$".".play("stage1")
	elif animation_stage ==2:
		$".".play("stage2")
	else:
		pass

func _process(delta):
	var isUnderSun = false
	if global_rotation_degrees > -130 && global_rotation_degrees < 30:
		growthRate = abs((global_rotation_degrees + 50) / 80)
		isUnderSun = true
	
	if isUnderSun:
		if time > 0:
			time = time - (delta * PI * growthRate)
		else:
			nextGrowthStage()
		
	
