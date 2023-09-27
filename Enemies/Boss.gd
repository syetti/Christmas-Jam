extends RigidBody2D


var speed =5500
var velocity = Vector2()
var cbodies = get_colliding_bodies()
# Called when the node enters the scene tree for the first time.
func _ready():
	#$"../AnimationPlayer".play("Move Pattern")
	pass
#onready var path_follow = $".."
var health = 100
var vector = 0
func _physics_process(delta):
	$"../bosshealth".value = health
	if PlayerData.boss_spawn == true:
		$"../bosshealth".show()
	if health <= 0:
		boss_dead()
	
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

func boss_dead() -> void:
	PlayerData.boss_dead=true
	queue_free()


func _on_collision_area_entered(area:Area2D):
	if area.is_in_group("Bullet"):
		health -= 5
	if area.is_in_group("mc"):
		$AnimatedSprite2D.play("attack")
