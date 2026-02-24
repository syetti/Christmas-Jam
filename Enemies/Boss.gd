class_name Boss extends Enemy




# Called when the node enters the scene tree for the first time.
func _ready():
	health = 1000
	player = find_player()
	pass
	
func find_player()-> Node2D : 
	var bodies = $Detect.get_overlapping_bodies()
	for i in bodies:
		if i.is_in_group("mc"):
				return i
		else:
			return null
	return null
	
func _physics_process(delta):
	if not player:
		player = find_player()
	
	if health <= 0:
		boss_dead()
		
	if player:
		var dir = (player.get_global_position() - get_global_position()).normalized()
		velocity = dir * speed
		move_and_slide()
	pass


func boss_dead() -> void:
	PlayerData.boss_dead=true
	queue_free()


func _on_collision_area_entered(area:Area2D):
	if area.is_in_group("Bullet"):
		health -= 1
	if area.is_in_group("mc"):
		$AnimatedSprite2D.play("attack")
