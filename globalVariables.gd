extends Node

var seedCount = 5
var oxygenLevel = 100

func set_oxygen_level(var v):
	oxygenLevel = v
	
func increment_oxygen_level_by(var v):
	oxygenLevel += v
	
func decrement_oxygen_level_by(var v):
	oxygenLevel -= v
	
func get_oxygen_level():
	return oxygenLevel

func get_Seed_Count():
	return seedCount


func set_Seed_Count(var v):
	seedCount = v


func increment_Seed_Count():
	seedCount += 1


func increment_Seed_Count_by(v):
	seedCount += v


func decrement_Seed_Count():
	seedCount -= 1


