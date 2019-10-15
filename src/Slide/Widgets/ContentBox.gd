tool
extends Control


onready var rich_text_label: = $Margin/Column/Text
onready var label_subtitle: = $Margin/Column/Subtitle

export var subtitle: = "" setget set_subtitle
export(String, MULTILINE) var text: = "" setget set_text
export var center: = false setget set_center

var _text_processed: = ""


func _ready() -> void:
	update_text()


func set_text(string: String) -> void:
	text = string
	if not rich_text_label:
		return
	update_text()


func set_subtitle(string: String) -> void:
	subtitle = string
	if not label_subtitle:
		return
	update_text()


func set_center(value: bool) -> void:
	center = value
	if not rich_text_label:
		return
	update_text()


func update_text() -> void:
	if center:
		_text_processed = center_text(text)
	else:
		_text_processed = text
	label_subtitle.text = subtitle
	label_subtitle.visible = subtitle != ""
	rich_text_label.bbcode_text = _text_processed
	visible = text != ""


func center_text(string: String) -> String:
	var bbcode: = ""
	for line in string.split("\n"):
		line = "%s%s%s" % ["[center]", line, "[/center]"]
		bbcode += line + "\n"
	return bbcode


func get_translation_data() -> Dictionary:
	return { 'text': text }
