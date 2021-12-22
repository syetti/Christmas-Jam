extends Node2D
#var gunmousepos = Vector2(0,get_global_mouse_position().y)
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
	


func _physics_process(_delta):
#	$Ray.set_position(self.get_position())
#	$Ray.set_cast_to(gunmousepos)
	look_at(get_global_mouse_position())
