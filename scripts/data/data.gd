class_name Data
extends Resource

## Contain data to save and load.

## Current amount of pixels avaliable
@export var pixels : int = 0

@export var pixels_per_second : int = 0

## This is the total amount of pixels generated for a picture divided by the amoutn of pixels needed for the picture 
@export var total_pixels : int = 0

## Upgrades
@export var up_01_level : int = 0
@export var up_01_cost : int = 0 

## Images and Noise
@export var current_image_path : String = ""
@export var avaliable_pixels : Array = []
