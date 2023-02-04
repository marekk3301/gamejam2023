extends Node

var seedCount = 5
var oxygenLevel = 100
var maxOxygenLevel = 100

var activePlantList = []

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


func add_to_activePlantList(plantToAdd):
	activePlantList.append(plantToAdd)


func remove_from_activePlantList(plantToRemove):
	activePlantList.erase(plantToRemove)
	#for i in range(len(activePlantList)):
	# 	if activePlantList[i] == plantToRemove:
	# 		activePlantList.pop_at(i)


func getPlantNumberInType(type):
	var count = 0
	# print(activePlantList)
	for plant in activePlantList:
		if plant.animation_stage == type:
			count += 1
	return count
