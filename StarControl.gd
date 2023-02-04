extends Control

var start_game_label = Label.new()
	
# Called when the node enters the scene tree for the first time.
func _on_ParentControl_resized():
	start_game_label.set_position(Vector2(get_size().x / 2, get_size().y / 2))

func _ready():
	get_tree().get_root().connect("size_changed", self, "_on_ParentControl_resized")
	# tworzy napis i dodaje go do sceny
	start_game_label.set_text("Start game")
	start_game_label.set_position(Vector2(get_size().x / 2, get_size().y / 2))
	add_child(start_game_label)

func _input(event):
	# sprawdza czy nastąpiło kliknięcie myszką
	if event.is_action_pressed("ui_click"):
		# ładuje scenę "main"
		get_tree().change_scene("res://scenes/main.tscn")
