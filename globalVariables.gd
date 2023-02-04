extends Node

var seedCount = 5;


func get_Seed_Count():
	return seedCount;


func set_Seed_Count(var v):
	seedCount = v


func increment_Seed_Count():
	seedCount += 1


func increment_Seed_Count_by(v):
	seedCount += v


func decrement_Seed_Count():
	seedCount -= 1


