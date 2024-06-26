class_name Up01ClickerUpgrade
extends Upgrade
## Upgrade 01 - Increases Pixel Creation Speed

## load data
func _init() -> void:
	level = Game.ref.data.up_01_level
	#level = 0
	title = "Pixel Speed"
	base_cost = 10
	calculate_cost()

func description() -> String:
	var _description : String = "Increases Pixels generation speed"
	_description += "\nEffects : +1 Pixels / Level"
	_description += "\n Cost : %s" %cost
	return _description
	
## returns current cost
func calculate_cost():
	cost = floor(base_cost*(1.1)**(level))

## returns whether or not, player can afford upgrade
func can_afford() -> bool:
	if HandlerPixel.ref.pixel() >= cost:
		return true
	
	return false
## consumes pixels to level up
func level_up() -> void:
	var error : Error = HandlerPixel.ref.consume_pixels(cost)
	
	if not error:
		level += 1
		Game.ref.data.up_01_level = level 
		
		calculate_cost()
		leveled_up.emit()
