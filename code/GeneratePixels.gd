class_name GeneratePixel
extends View
## Auto generates Pixels

@export var label : Label
@export var button : Button
@export var timer : Timer

func _ready() -> void:
	super() ## this is for signaling and views
	visible = true
	
func generate_pixel() -> void:
	HandlerPixel.ref.trigger_upgrade()
	
func begin_generating_pixels() -> void:
	timer.start()
	button.disabled = true
	

func _on_button_pressed() -> void:
	begin_generating_pixels()


func _on_timer_timeout() -> void:
	generate_pixel()


func _on_generate_pressed():
	#Game.ref.data.pixels = 0
	#Game.ref.data.up_01_level = 0
	begin_generating_pixels()

