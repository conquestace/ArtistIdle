class_name HandlerPixel
extends Node


## Singleton reference
static var ref : HandlerPixel

## Singleton check
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()
	
## emits signals
signal pixel_created(quantity : int)
signal pixel_consumed(quantity : int)


## Returns current amount of pixels avaliable
func pixel() -> int:
	return Game.ref.data.pixels

func pixels_per_second() -> int:
	return Game.ref.data.pixels_per_second

## Returns total amount of pixels avaliable
func total_pixels() -> int:
	return Game.ref.data.total_pixels

	
## Creates a specific amount of Pixels
func generate_pixels(quantity : int) -> void:
	Game.ref.data.pixels += quantity
	Game.ref.data.total_pixels += quantity
	Game.ref.data.pixels_per_second = quantity
	pixel_created.emit(quantity)

## Consume a specific amount of Pixels
func consume_pixels(quantity : int) -> Error:
	if quantity > Game.ref.data.pixels:
		return Error.FAILED
	
	Game.ref.data.pixels -= quantity
	pixel_consumed.emit(quantity)
	
	return Error.OK

## triggered by the upgrade to generate pixels
func trigger_upgrade() -> void:
	var quantity : int = 1
	quantity += Game.ref.data.up_01_level
	generate_pixels(quantity)
