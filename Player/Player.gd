extends KinematicBody2D

var health = 100
var speed =100
var velocity = Vector2()

func shoot():
	
	var bullet = preload("res://Bullet/Bullet.tscn").instance()
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
	
	$TextureProgress.value = health
	if health <= 0:
		died()
		queue_free()
	if velocity*speed ==Vector2(0,0):
		$AnimatedSprite.play("idle")

	else: 
		$AnimatedSprite.play("run")
	
	_get_input()
	shooting()
	velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	
	pass # Replace with function body.


func _on_Area2D_area_entered(area:Area2D):
	if area.is_in_group("Enemy"):
		health-=20
		$TextureProgress.show()
	pass # Replace with function body.'
	if area.is_in_group("boss"):
		health-=30
		$TextureProgress.show()
func died() -> void :
	PlayerData.deaths+=1
	PlayerData.reset_score()
	PlayerData.reset_level()
	queue_free()