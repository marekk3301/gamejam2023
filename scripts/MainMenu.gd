extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()
	pass
func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/main.tscn")
	# Replace with function body.


func _on_ExitButton_pressed():
	get_tree().quit()
