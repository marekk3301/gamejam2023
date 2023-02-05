extends Label


func _ready():
	pass
	
func _process(delta):
	var score = 0
	GlobalVariables.increment_Score(0.009)
	score =  int(GlobalVariables.get_Score())
	text = str(score)
