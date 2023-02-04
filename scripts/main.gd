extends Node2D

var plantScene = load("res://scenes/plant.tscn")
var planetRadius = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	planetRadius = $planet.texture.get_height() / 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = 0
	if Input.is_action_pressed('reset'):
		GlobalVariables.set_Seed_Count(5)
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
	

	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()

	$TextureProgress.value += 1


func plant_seed():
	if GlobalVariables.get_Seed_Count() > 0:
		var plant = plantScene.instance()
		var angle = -$planet.rotation - PI/2
		plant.scale = Vector2(0.2, 0.2)
		plant.position = Vector2(planetRadius*cos(angle), planetRadius*sin(angle))
		plant.rotation = angle + PI / 2
		$planet.add_child(plant)
		GlobalVariables.decrement_Seed_Count()


func _input(event):
	if event.is_action_pressed("plant_seed"):
		plant_seed()
