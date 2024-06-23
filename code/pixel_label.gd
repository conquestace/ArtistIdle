class_name PixelLabel
extends Label

## connecting signals
func _ready() -> void:
	update_text()
	HandlerPixel.ref.pixel_consumed.connect(update_text)
	HandlerPixel.ref.pixel_created.connect(update_text)

func update_text(_quantity : int = -1) -> void:
	text = "Pixels : %s" %HandlerPixel.ref.pixel()
	
	## Changes the colour based on the current amount of pixels
	var red_colour = 0.5*sin(HandlerPixel.ref.pixel())+0.5
	var green_colour = 0.5*cos(HandlerPixel.ref.pixel())+0.5
	var blue_colour = 0.5*(sin(HandlerPixel.ref.pixel())+cos(HandlerPixel.ref.pixel()))+1
	#print("R: " + str(int(127*red_colour)) + " G: " + str(int(127*green_colour)) + " B: " + str(int(127*blue_colour)))
	modulate = Color(red_colour, green_colour, blue_colour)
