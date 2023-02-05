extends Node2D

var plantScene = load("res://scenes/plant.tscn")
var planetRadius = 0

var oxygenLevel = 100
var initialOxygenFill = true
var initialOxygenFillCount = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	planetRadius = $planet.texture.get_height() / 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_help"):
		$help.visible =  true
	else:
		$help.visible =  false
	if Input.is_action_pressed('reset'):
		GlobalVariables.set_Seed_Count(5)
		GlobalVariables.clearActivePlantList()
		GlobalVariables.reset_cracksOnCoreCount()
		get_tree().change_scene("res://scenes/main.tscn")
		
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_pressed("ui_left"):
		direction += 1
		$player.get_node("playerSprite").play("walk")
	elif Input.is_action_pressed("ui_right"):
		direction = -1
		$player.scale = Vector2(-1, 1)
		$player.get_node("playerSprite").play("walk")
	else:
		$player.scale = Vector2(1, 1)
		$player.get_node("playerSprite").play("idle")

	$planet.rotate(direction*delta)
	$planet2.rotate(direction*delta)
	$PlanetLight.rotate(direction*delta)
	$Sun.rotate(delta*0.05)
	$Moon.rotate(delta*-0.05)
	$planet2/Core.rotate(delta*-0.05*direction)
	

	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()

	if initialOxygenFill:
		if initialOxygenFillCount < oxygenLevel:
			get_node("%TextureProgress").value += 1
			get_node("%TextureProgress").set_size(Vector2(0.1,0.1))
			initialOxygenFillCount += 1
			if initialOxygenFillCount == 100: 
				initialOxygenFill = false
	else:
		var mediumOxygenInput = GlobalVariables.getPlantNumberInType(3)
		var bigOxygenInput = GlobalVariables.getPlantNumberInType(4) + GlobalVariables.getPlantNumberInType(5)
		
		var seedCount = GlobalVariables.get_Seed_Count()
		
		var oxygenLevelIncrease = (0.2*mediumOxygenInput + 0.6*bigOxygenInput + 1) * 0.05
		# seedCount / 5 -> decreseas the influence of seedCount on decrease
		# + 0.9 makes sure the oxygen still decreases when the player has 0 seeds
		var oxygenLevelDecrease = 1.8 * (seedCount/5 + 0.9) * 0.04
		
		oxygenLevel += oxygenLevelIncrease
		oxygenLevel -= oxygenLevelDecrease
		if oxygenLevel > 100: oxygenLevel = 100
		
		if oxygenLevel <= 0:
			get_tree().change_scene("res://scenes/gameOver.tscn")
		
		get_node("%TextureProgress").value = oxygenLevel

	get_node("%TextureProgress").value += 1
	get_node("%TextureProgress").set_size(Vector2(0.1,0.1))


func plant_seed():
	if GlobalVariables.get_Seed_Count() > 0:
		var plant = plantScene.instance()
		var angle = -$planet.rotation - PI/2
		plant.scale = Vector2(0.2, 0.2)
		plant.position = Vector2(planetRadius*cos(angle), planetRadius*sin(angle))
		plant.rotation = angle + PI / 2
		plant.z_index = -1
		$planet.add_child(plant)
		GlobalVariables.add_to_activePlantList(plant)
		GlobalVariables.decrement_Seed_Count()


func _input(event):
	if event.is_action_pressed("plant_seed"):
		plant_seed()
