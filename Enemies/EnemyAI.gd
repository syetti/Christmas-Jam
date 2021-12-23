extends RigidBody2D


var speed =2000
var velocity = Vector2()
var cbodies = get_colliding_bodies()
# Called when the node enters the scene tree for the first time.
func _ready():
	#$"../AnimationPlayer".play("Move Pattern")
	pass
#onready var path_follow = $".."
var health = 3
var vector = 0
func _physics_process(delta):
	if health <= 0:
		queue_free()
	
	#zoom+=delta
	#path_follow.offset = speed * zoom
	var bodies = $Detect.get_overlapping_bodies()
	for i in bodies:
		if $Detect.overlaps_body(i):
			if i.is_in_group("mc"):
				vector = (i.get_global_position() - get_global_position()).normalized()
				
				set_linear_velocity(vector*speed*delta)
	for i in cbodies:
		if i.is_in_group("Bullet"):
			$"..".queue_free()

	
	pass




func _on_collision_area_entered(area:Area2D):
	if area.is_in_group("Bullet"):
		health -= 1
