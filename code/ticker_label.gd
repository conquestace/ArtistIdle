class_name TickerLabel
extends Label

var model : String = "ConquestMerge"
var GPU : String = "Nvidia RTX 1060"
var VRAM : int = 3

## connecting signals
func _ready() -> void:
	update_text()
	HandlerPixel.ref.pixel_consumed.connect(update_text)
	HandlerPixel.ref.pixel_created.connect(update_text)

func update_text(_quantity : int = -1) -> void:
	text = "Total Pixels: %s, Model : %s, GPU : %s, VRAM : %s GB, Current Pixels : %s, PPS : %s" %[HandlerPixel.ref.total_pixels(), model, GPU, VRAM, HandlerPixel.ref.pixel(), HandlerPixel.ref.pixels_per_second()]
