extends Node

var seedCount = 5
var cracksOnCore = 0
var score = 0
var activePlantList = []
var scoreCheck = 0


func get_Seed_Count():
	return seedCount


func set_Seed_Count(var v):
	seedCount = v
func get_scoreCheck(v):
	seedCount = v
func set_scoreCheck(v):
	seedCount = v
	
func increment_Seed_Count():
	seedCount += 1


func increment_Seed_Count_by(v):
	seedCount += v

func increment_Score(v):
	score += v
func set_Score():
	score = 0
	
func get_Score():
	return score

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
		if plant != null:
			if plant.animation_stage == type:
				count += 1
	return count
	
func clearActivePlantList():
	activePlantList = []

func reset_cracksOnCoreCount():
	cracksOnCore = 0
	
func get_cracksOnCoreCount():
	return cracksOnCore

func incrementCracksOnCore():
	cracksOnCore += 1
