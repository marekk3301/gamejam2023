extends Area2D

signal hit

onready var timer = get_node("Timer")
var rng = RandomNumberGenerator.new()
var time = rng.randi_range(2, 5)
var animation_stage = 0
var growthRate = 0
var isCut = false

var CollidingBody = null

func _ready():
	timer.wait_time = 3
	timer.connect("timeout", self, "_on_timer_timeout")

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
		timer.start()
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
	if animation_stage == 5:
		isCut = true


func _input(event):
	if event.is_action_pressed("cut_plant") && CollidingBody != null:
		hide()
		emit_signal("hit")
		$CollisionShape2D.set_deferred("disabled", true)

		if animation_stage < 4:
			var seedYield = rng.randf_range(0, 2)
			GlobalVariables.increment_Seed_Count_by(int(seedYield))

		else:
			var seedYield = rng.randi_range(0, 3)
			GlobalVariables.increment_Seed_Count_by(int(seedYield))

		GlobalVariables.remove_from_activePlantList(self)
			  

func _on_timer_timeout():
	if !isCut:
		# get_tree().change_scene("res://scenes/gameOver.tscn")
		pass
	isCut = false
