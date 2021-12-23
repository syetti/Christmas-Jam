extends RigidBody2D

#onready var anim = get_node("AnimationPlayer")
var RUN_SPEED = 82000
	
func _physics_process(delta):
	RUN_SPEED*=delta
	apply_impulse(Vector2(), Vector2(RUN_SPEED,0).rotated(rotation))

		


func _on_Area2D_area_enter( area ):
	if area.is_in_group("Enemy"):
		queue_free()

		
	if area.is_in_group("Bullet_death"):
		queue_free()


		

func _on_Timer_timeout():
	get_node("Muzzle_Flash").hide()
