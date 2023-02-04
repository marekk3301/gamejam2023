extends Node2D

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
	if Input.is_action_pressed("ui_right"):
		direction = -1
		
	$planet.rotate(direction*delta)
	if direction == 0:
		$player.play("idle")
	elif direction == 1:
		$player.play("left")
	else:
		$player.play("right")
		
