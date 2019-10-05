extends Control
class_name Slide


signal animation_finished

onready var anim_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	anim_player.connect("animation_finished", self, "_on_AnimationPlayer_animation_finished")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	emit_signal("animation_finished")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_next") or event.is_action_pressed("ui_previous"):
		anim_player.seek(anim_player.current_animation_length, true)
		emit_signal("animation_finished")
		accept_event()
		set_process_unhandled_input(false)


func play(anim_name: String, speed: = 1.0) -> void:
	assert(anim_player and anim_name in anim_player.get_animation_list())
	set_process_unhandled_input(true)
	anim_player.playback_speed = speed
	anim_player.play(anim_name)


func is_playing() -> bool:
	return anim_player.is_playing()
