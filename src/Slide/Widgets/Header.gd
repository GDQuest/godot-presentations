tool
extends Control


onready var title_node: = $Background/Title

export var title: = "" setget set_title
export var font_override: Resource

var font_title_default: Resource = preload("res://assets/theme/fonts/title_montserrat.tres")
var font_subtitle_default: Resource = preload("res://assets/theme/fonts/subtitle_montserrat.tres")
var font_title_cjk: Resource = preload("res://assets/theme/fonts/title_noto.tres")
var font_subtitle_cjk: Resource = preload("res://assets/theme/fonts/subtitle_noto.tres")


var FONTS_DEFAULT: = {
	title=font_title_default,
	subtitle=font_subtitle_default,
}
var FONTS_CJK: = {
	title=font_title_cjk,
	subtitle=font_subtitle_cjk,
}


func _ready() -> void:
	self.title = title


func set_title(string: String) -> void:
	title = string
	if not title_node:
		return
	title_node.text = string


func translate() -> void:
	if font_override:
		title_node.set('custom_fonts/font', font_override)
		return

	var locale: = TranslationServer.get_locale()
	var fonts: = FONTS_DEFAULT
	if locale in ['ja', 'ko', 'zh', 'ar']:
		fonts = FONTS_CJK

	title_node.set('custom_fonts/font', fonts['title'])


func get_translation_data() -> Dictionary:
	return { 'title': title }
