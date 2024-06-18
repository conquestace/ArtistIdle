class_name GeneratePixel
extends Control

@export var label : Label
@export var button : Button
@export var timer : Timer

## for Signalling
@export var view : UserInterface.Views
## references to the user interface
@export var user_interface : UserInterface



func _ready() -> void:
	update_label_text()
	user_interface.navigation_requested.connect(_on_navigation_request)
	visible = true

func _procress(_delta: float) -> void:
	update_label_text()
	
func generate_pixel() -> void:
	Game.ref.data.pixels += 1
	update_label_text()
	
func update_label_text() -> void:
	label.text = "Pixels: %s" %Game.ref.data.pixels

func begin_generating_pixels() -> void:
	timer.start()
	button.disabled = true
	

func _on_button_pressed() -> void:
	begin_generating_pixels()


func _on_timer_timeout() -> void:
	generate_pixel()


func _on_generate_pressed():
	begin_generating_pixels()

## Watches for navigation request and reacts accordingly
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false

