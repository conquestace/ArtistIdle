class_name PixelLabel
extends Label


## connecting signals
func _ready() -> void:
	update_text()
	HandlerPixel.ref.pixel_consumed.connect(update_text)
	HandlerPixel.ref.pixel_created.connect(update_text)

func update_text(_quantity : int = -1) -> void:
	text = "Pixels : %s" %HandlerPixel.ref.pixel()
