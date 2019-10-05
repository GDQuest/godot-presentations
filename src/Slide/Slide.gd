extends Control
class_name Slide


onready var anim_player: AnimationPlayer = $Animationanim_player


func play(anim_name: String) -> void:
	if not anim_player or not anim_name in anim_player.get_animation_list():
		return
	anim_player.play(anim_name)
	yield(anim_player, "animation_finished")
