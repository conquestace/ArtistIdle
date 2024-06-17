class_name Game
extends Control
##Clicker for Artist AIdle.


@export var label : Label
##Current amount of Pixels baked.
var pixels : int = 0


## Initialize the game at launch.
func _ready() -> void:
	update_label_text()


## Creates 1 pixel per click.
func generate_pixel() -> void:
	pixels += 1
	update_label_text()

## Updates the label
func update_label_text() -> void:
	label.text = "Pixels : %s" %pixels
	
	
## Clicking the Button generates pixels
func _on_generate_pressed() -> void:
	generate_pixel()
	
