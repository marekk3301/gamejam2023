extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if GlobalVariables.get_cracksOnCoreCount() == 0:
		$".".play("CoreIdle")
		$".".rotate(delta*-0.04)
	elif GlobalVariables.get_cracksOnCoreCount() == 1:
		$".".play("Corestage1")
	elif GlobalVariables.get_cracksOnCoreCount() == 2:
		$".".play("Corestage2")
	else:
		$".".play("Corestage3")
	$".".rotate(delta*-0.04)
	
	
