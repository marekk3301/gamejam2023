extends Area2D

signal hit

var rng = RandomNumberGenerator.new()
var time = rng.randi_range(2, 5)
var animation_stage = 0
var growthRate = 0
var isCut = false
var lastStageTimer = -1

var CollidingBody = null


func nextGrowthStage():
	animation_stage += 1
	time = rng.randf_range(2, 5)
	if animation_stage == 1:
		$PlantSprite.play("stage1")
	elif animation_stage ==2:
		$PlantSprite.play("stage2")
	elif animation_stage ==3:
		$PlantSprite.play("stage3")
	elif animation_stage ==4:
		$PlantSprite.play("stage4")
	elif animation_stage ==5:
		$PlantSprite.play("stage5")
	elif animation_stage ==6:
		$PlantSprite.play("stage6")
		lastStageTimer = 3
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
			
	if lastStageTimer > 0:
		lastStageTimer -= delta * 3	
	if lastStageTimer <= 0 && lastStageTimer != -1:
		if isCut:	
			isCut = false
			lastStageTimer = -1			
		else:
			if GlobalVariables.get_cracksOnCoreCount() == 2:
				get_tree().change_scene("res://scenes/gameOver.tscn")
			else:	
				GlobalVariables.incrementCracksOnCore()
				lastStageTimer = -1
			


func _on_plant_area_entered(area):
	CollidingBody = area

	

func _on_plant_area_exited(area):
	CollidingBody = null


func _input(event):
	if event.is_action_pressed("cut_plant") && CollidingBody != null:
		hide()
		emit_signal("hit")
		$CollisionShape2D.set_deferred("disabled", true)
		print(animation_stage)
		if animation_stage >= 5:			
			isCut = true

		if animation_stage < 4:
			var seedYield = rng.randf_range(0, 2)
			GlobalVariables.increment_Seed_Count_by(int(seedYield))

		else:
			var seedYield = rng.randi_range(0, 3)
			GlobalVariables.increment_Seed_Count_by(int(seedYield))

		GlobalVariables.remove_from_activePlantList(self)
			  

