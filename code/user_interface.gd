class_name UserInterface
extends Control
##Main Screen for Artist AIdle.

enum Views {
	GENERATE_PIXELS,
	SHOP,
}

signal navigation_requested(view : Views)


func _on_gen_pix_link_pressed() -> void:
	navigation_requested.emit(Views.GENERATE_PIXELS)


func _on_shoplink_pressed() -> void:
	navigation_requested.emit(Views.SHOP)
