extends Control

onready var tween_out 

export var transition_duration = 1.00
export var transition_type = 1 # TRANS_SINE

func _ready():
	$VBoxContainer/StartButton.grab_focus()
	tween_out = get_node("Tween")
	pass
	
func _process(delta):
	if $AudioStreamPlayer.playing == false:
			$AudioStreamPlayer.play()
func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/main.tscn")
	fade_out($AudioStreamPlayer)
	# Replace with function body.


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_controls_pressed():
	get_tree().change_scene("res://scenes/controls.tscn")
	pass # Replace with function body.


func fade_out(stream_player):
	# tween music volume down to 0
	tween_out.interpolate_property(stream_player, "volume_db", 0, -80, transition_duration, transition_type, Tween.EASE_IN, 0)
	tween_out.start()
	# when the tween ends, the music will be stopped

func _on_TweenOut_tween_completed(object, key):
	# stop the music -- otherwise it continues to run at silent volume
	object.stop()
