extends Area2D

signal hit

var time = 5
var animation_stage = 0
var growthRate = 0

var CollidingBody = null

func _ready():
	pass

func nextGrowthStage():
	animation_stage += 1
	time = 5
	if animation_stage == 1:
		$PlantSprite.play("stage1")
	elif animation_stage ==2:
		$PlantSprite.play("stage2")
	elif animation_stage ==3:
		$PlantSprite.play("stage3")
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


func _on_plant_area_entered(area):
	CollidingBody = area

	

func _on_plant_area_exited(area):
	CollidingBody = null


func _input(event):
	if event.is_action_pressed("cut_plant") && CollidingBody != null:
		hide()
		emit_signal("hit")
		$CollisionShape2D.set_deferred("disabled", true)
		
		GlobalVariables.increment_Seed_Count()
