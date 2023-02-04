extends Node2D

var plantScene = load("res://scenes/plant.tscn")
var planetRadius = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	planetRadius = $planet.texture.get_height() / 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction += 1		
		$player.play("left")
	elif Input.is_action_pressed("ui_right"):
		direction = -1
		$player.scale = Vector2(-1, 1)
		$player.play("left")
	else:
		$player.scale = Vector2(1, 1)
		$player.play("idle")
		
	$planet.rotate(direction*delta)
	
	
func plant_seed():
	var plant = plantScene.instance()
	var angle = $planet.rotation
	plant.scale = Vector2(0.2, 0.2)
	plant.position = Vector2(planetRadius*cos(angle), planetRadius*sin(angle))
	plant.rotation = angle
	$planet.add_child(plant)
	print(angle)
		
	
func _input(event):
	if event.is_action_pressed("plant_seed"):
		plant_seed()
