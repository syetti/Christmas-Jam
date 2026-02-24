class_name Enemy extends CharacterBody2D


var speed = 100


var player:Node
var health = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("walking")
	pass
	
func find_player()-> Node2D : 
	var bodies = $Detect.get_overlapping_bodies()
	for i in bodies:
		if i.is_in_group("mc"):
				return i
	return null
	
func _physics_process(delta):
	if not player:
		player = find_player()
	
	if health <= 0:
		scored()
		
	if player:
		var dir = (player.get_global_position() - get_global_position()).normalized()
		velocity = dir * speed
		move_and_slide()
	pass

func scored() -> void:
	PlayerData.score +=1
	PlayerData.global_enemy_num -=1
	queue_free()




func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		health -= 1
		pass # Replace with function body.
