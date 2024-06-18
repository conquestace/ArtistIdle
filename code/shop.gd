class_name Shop
extends Control

## for Signalling
@export var view : UserInterface.Views
@export var user_interface : UserInterface

func _ready() -> void:
	user_interface.navigation_requested.connect(_on_navigation_request)
	visible = false

## Watches for navigation request and reacts accordingly
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false
