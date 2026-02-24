extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("ENDFADE")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "ENDFADE":
		var respawnButton = preload("res://RespawnButton.tscn")
		respawnButton.instantiate()
		
		
