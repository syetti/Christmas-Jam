class_name Player extends CharacterBody2D



var health = 100
var speed =300
var can_shoot = true

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
	if not can_shoot:
		return
	if Input.is_action_pressed("ui_select") :
		shoot()
		can_shoot = false
		$Bulletspawn/Timer.start(2)

func _process(_delta):
	
	$TextureProgressBar.value = health
	if health <= 0:
		died()
		queue_free()
	if velocity == Vector2(0,0):
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("run")
	_get_input()
	
	if $Bulletspawn/Timer.timeout:
		can_shoot = true
		shooting()
	move_and_slide()
	
	

func _on_Area2D_area_entered(area:Area2D):
	if area.is_in_group("Enemy"):
		damage_player(20)
		
	if area.is_in_group("boss"):
		damage_player(30)
		
func died() -> void :
	PlayerData.deaths+=1
	PlayerData.reset_score()
	PlayerData.reset_level()
	PlayerData.player_dead(true)
	queue_free()

func damage_player(damage: int):
	health -= damage
	position += Vector2(randf_range(-2, 2), randf_range(-2,2))
	$TextureProgressBar.show()
	$TextureProgressBar/healthtimer.start(3)
	
	
	
func _on_healthtimer_timeout() -> void:
	$TextureProgressBar.hide()
