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
	text = "Model : %s, GPU : %s, VRAM : %s GB, Pixels : %s" %[model, GPU, VRAM, HandlerPixel.ref.pixel()]
