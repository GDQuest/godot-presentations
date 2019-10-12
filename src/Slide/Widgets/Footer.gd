tool
extends Control


export(String, MULTILINE) var text: = "" setget set_text

onready var label: Label = $Background/Label


func set_text(string: String) -> void:
	text = string
	visible = text != ""
	if not label:
		return
	label.text = string


func get_translation_data() -> Dictionary:
	return {'text': text}
