class_name Upgrade
extends Node
## Abstract class defining an upgrade
#base scanton? for making a class in the future
signal leveled_up

var level : int = -1  #unlimited levels
var title : String = "not defined: fix if you see" #make blank at endproduct
var base_cost : int = -1 
var cost : int = -1

## Virtual class, must be overwritten
func description() -> String:
	return "Description: not defined"
	
## Virtual class, must be overwritten
func calculate_cost() -> void:
	printerr("calculate_cost() method not defined.")
	
## Virtual class, must be overwritten
## returns whether or not, player can afford upgrade
func can_afford() -> bool:
	return false

## Virtual class, must be overwritten
## consumes pixels to level up
func level_up() -> void:
	printerr("level_up() method not defined.")
