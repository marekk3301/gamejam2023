extends Light2D

var growing = true
func _ready():
	_on_ParentControl_resized()
	get_tree().get_root().connect("size_changed", self, "_on_ParentControl_resized")
func _process(delta):
	if growing:
		self.energy += 0.05		
	else:
		self.energy -= 0.05		

	if self.energy >= 0.8 or self.energy <= 0.07:
		growing = !growing

func _on_ParentControl_resized():
	var screen_size = get_viewport().size
	self.position = Vector2(screen_size.x / 2, screen_size.y / 2)
