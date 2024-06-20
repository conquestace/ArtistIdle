class_name CompoUpgrade
extends Control

## Component displaying an upgrade

## Export vars for labels and buttons
@export var label_title : Label
@export var label_description : RichTextLabel
@export var button : Button


## Upgrade to Display
var upgrade : Upgrade

func _ready() -> void:
	upgrade = Up01ClickerUpgrade.new()
	#ini the labels
	update_label_title()
	update_label_description()
	update_button()
	#signals sent
	HandlerPixel.ref.pixel_created.connect(update_button)
	HandlerPixel.ref.pixel_consumed.connect(update_button)

	upgrade.leveled_up.connect(update_label_title)
	upgrade.leveled_up.connect(update_label_description)
	upgrade.leveled_up.connect(update_button)
	
func update_label_title() -> void:
	var text : String = upgrade.title + " (%s)" %upgrade.level
	label_title.text = text

func update_label_description() -> void:
	label_description.text = upgrade.description()
	

## updates the button avaliablity 
func update_button(_quantity : int = -1) -> void:
	if upgrade.can_afford():
		button.disabled = false
		return
		
	button.disabled = true

## Triggered when the purchase button is pressed
func _on_purchase_button_pressed() -> void:
	upgrade.level_up()
