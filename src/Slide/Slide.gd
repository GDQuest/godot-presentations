extends Control
class_name Slide


onready var anim_player: AnimationPlayer = $AnimationPlayer


func play(anim_name: String) -> void:
	assert(anim_player and anim_name in anim_player.get_animation_list())
	anim_player.play(anim_name)
	yield(anim_player, "animation_finished")
