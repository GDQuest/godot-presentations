tool
extends MarginContainer


export var margin_horizontal: = 0.0 setget set_margin_horizontal
export var margin_vertical: = 0.0 setget set_margin_vertical


func set_margin_horizontal(value: float) -> void:
	margin_horizontal = value
	set('custom_constants/margin_right', margin_horizontal)
	set('custom_constants/margin_left', margin_horizontal)


func set_margin_vertical(value: float) -> void:
	margin_vertical = value
	set('custom_constants/margin_top', margin_vertical)
	set('custom_constants/margin_bottom', margin_vertical)
