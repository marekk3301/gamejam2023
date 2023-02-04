extends Label


func _ready():
	pass
func _process(delta):
	var my_variable = GlobalVariables.get_Seed_Count()
	text = str(my_variable)
