tool
extends Control


onready var label: = $Background/Title
onready var anim_player: AnimationPlayer = $Background/AnimationPlayer

export(String, MULTILINE) var text: = "" setget set_text
export var capitalize: = true


func _ready() -> void:
	if Engine.editor_hint:
		anim_player.play("Visible")


func set_text(string: String) -> void:
	text = string
	if not label:
		return
	label.text = text if not capitalize else text.capitalize()
