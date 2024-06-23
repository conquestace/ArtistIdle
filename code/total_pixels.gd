class_name TotalPixelLabel
extends Label


## connecting signals
func _ready() -> void:
	update_text()
	HandlerPixel.ref.pixel_consumed.connect(update_text)
	HandlerPixel.ref.pixel_created.connect(update_text)

func update_text(_quantity : int = -1) -> void:
	text = "Total Pixels Generated: %s" %HandlerPixel.ref.total_pixels()
