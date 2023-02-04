extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/mainMenu.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_back_pressed():
	get_tree().change_scene("res://scenes/mainMenu.tscn")
	pass # Replace with function body.
