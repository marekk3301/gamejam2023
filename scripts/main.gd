extends Node2D

var plantScene = load("res://scenes/plant.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction += 1
		$player.play("left")
	elif Input.is_action_pressed("ui_right"):
		direction = -1
		$player.play("right")
	else:
		$player.play("idle")
		
	$planet.rotate(direction*delta)
	
	
func plant_seed():
	var plant = plantScene.instance()
	$planet.add_child(plant)
		
	
func _input(event):
	if event.is_action_pressed("plant_seed"):
		plant_seed()
