class_name UserInterface
extends Control
##Main Screen for Artist AIdle.

enum Views { 
	GENERATE_PIXELS,
	SHOP,
	RESOURCES,
	FAME,
}

signal navigation_requested(view : Views)


func _on_gen_pix_link_pressed() -> void:
	navigation_requested.emit(Views.GENERATE_PIXELS)


func _on_shoplink_pressed() -> void:
	navigation_requested.emit(Views.SHOP)


func _on_resources_pressed() -> void:
	navigation_requested.emit(Views.RESOURCES)


func _on_fame_pressed() -> void:
	navigation_requested.emit(Views.FAME)
