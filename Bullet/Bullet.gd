extends RigidBody2D

#onready var anim = get_node("AnimationPlayer")
var RUN_SPEED = 82000
var inacurracy = rand_range(-7000, 7000)
var velocity = Vector2(RUN_SPEED, inacurracy)
	


func _fixed_process(delta):
	var motion = velocity * delta
	self.position = velocity.x * motion

func _on_Area2D_body_enter( body ):
	#if body.is_in_group("Enemy"):
	#	anim.play("Bullexplode")
	#	queue_free()
		
		
	if body.is_in_group("Bullet_death"):
		queue_free()


func _on_Area2D_area_enter( area ):
	#if area.is_in_group("Enemy"):
		#anim.play("Bullexplode")

		
	if area.is_in_group("Bullet_death"):
		queue_free()


		

func _on_Timer_timeout():
	get_node("Muzzle_Flash").hide()