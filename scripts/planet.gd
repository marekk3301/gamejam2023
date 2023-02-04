extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	_on_ParentControl_resized()
	get_tree().get_root().connect("size_changed", self, "_on_ParentControl_resized")

# Called when the node enters the scene tree for the first time.
func _on_ParentControl_resized():
	var screen_size = get_viewport().size
	self.position = Vector2(screen_size.x / 2, screen_size.y / 2)
	
func _process(delta):
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
