extends CharacterBody2D

var health = 100
var speed =100


func shoot():
	
	var bullet = preload("res://Bullet/Bullet.tscn").instantiate()
	get_parent().add_child(bullet)
	bullet.set_global_position($Bulletspawn.get_global_position())
	bullet.rotation_degrees = $Bulletspawn.rotation_degrees
func _get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1 
	if Input.is_action_pressed("ui_right"):
		velocity.x +=1
	if Input.is_action_pressed("ui_left"):
		velocity.x -=1
	velocity = velocity.normalized() * speed
func shooting():
	if Input.is_action_pressed("ui_select")&& $Bulletspawn/Timer.get_time_left() == 0:
		shoot()
		$Bulletspawn/Timer.start(0.15)

func _process(_delta):
	
	$TextureProgressBar.value = health
	if health <= 0:
		died()
		queue_free()
	if velocity*speed ==Vector2(0,0):
		$AnimatedSprite2D.play("idle")

	else: 
		$AnimatedSprite2D.play("run")
	
	_get_input()
	shooting()
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity


func _on_Timer_timeout():
	
	pass # Replace with function body.


func _on_Area2D_area_entered(area:Area2D):
	if area.is_in_group("Enemy"):
		health-=20
		$TextureProgressBar.show()
	pass # Replace with function body.'
	if area.is_in_group("boss"):
		health-=30
		$TextureProgressBar.show()
func died() -> void :
	PlayerData.deaths+=1
	PlayerData.reset_score()
	PlayerData.reset_level()
	PlayerData.player_dead(true)
	queue_free()
