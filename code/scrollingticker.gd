class_name TickerText
extends Control

@onready var ticker_label = $TickerLabel
@onready var animation_player = $AnimationPlayer



func _ready():
	animation_player.play("Scroll")

func set_text(new_text):
	ticker_label.text = new_text
	reset_animation()

func reset_animation():
	animation_player.stop
	ticker_label.rect_min_size = Vector2(ticker_label.font.get_string_size(ticker_label.text).x, ticker_label.rect_min_size.y)
	animation_player.play("Scroll")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
