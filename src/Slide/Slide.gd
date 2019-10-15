tool
extends Control
class_name Slide


signal animation_finished

onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var header_hero: = $HeaderHero


export(String, MULTILINE) var text: = "" setget set_text
export var capitalize: = true setget set_capitalize


func _ready() -> void:
	anim_player.connect("animation_finished", self, "_on_AnimationPlayer_animation_finished")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	emit_signal("animation_finished")
	set_process_unhandled_input(false)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_next") or event.is_action_pressed("ui_previous"):
		_jump_to_animation_end()
		accept_event()


func play(anim_name: String, speed: = 1.0, skip_animation=false) -> void:
	assert(anim_player and anim_name in anim_player.get_animation_list())
	set_process_unhandled_input(true)
	anim_player.playback_speed = speed
	anim_player.play(anim_name)
	if skip_animation:
		_jump_to_animation_end()


func is_playing() -> bool:
	return anim_player.is_playing()


func set_text(string: String) -> void:
	text = string
	if not header_hero:
		return
	header_hero.text = text


func set_capitalize(value: bool) -> void:
	capitalize = value
	if not header_hero:
		return
	header_hero.capitalize = capitalize


func _jump_to_animation_end() -> void:
	anim_player.seek(anim_player.current_animation_length, true)
	emit_signal("animation_finished")
	set_process_unhandled_input(false)
