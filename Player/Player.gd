extends KinematicBody2D


var speed = 1000
var velocity = Vector2()
func shoot():
	var bullet = preload("res://Bullet/Bullet.tscn").instance()
	get_parent().add_child(bullet)
	bullet.set_global_position(get_node("Bulletspawn").get_global_position())

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
	if Input.is_action_pressed("ui_space"):
		shoot()
# Called when the node enters the scene tree for the first time.
func _process(_delta):
	_get_input()
	shooting()
	velocity = move_and_slide(velocity)
	if velocity == 0:
		$AnimatedSprite.play("run")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
