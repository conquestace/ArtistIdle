class_name TickerLabel
extends Label

func _onready():
	text = "pixel"

func _process(_delta: float) -> void:
	update_text()
	
func update_text() -> void:
	text = "Pixels : %s" %Game.ref.data.pixels
