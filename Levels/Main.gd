extends Node2D
var enemy_num = 0
var spawn :bool = false
func _spawn_enemy():
	var enemy = preload("res://Enemies/enemies.tscn").instance()
	$".".add_child(enemy)
	enemy.set_position(Vector2(rand_range(0,339), rand_range(0,208)))
func _boss_spawn():
	var boss = preload("res://Enemies/bigboss.tscn").instance()
	get_parent().add_child(boss)
var spawning_hat = true
func _ready():
	set_process(true)
func spawn_hat():
	var hat = preload("res://Hat.tscn").instance()
	$".".add_child(hat)
	

func _process(_delta):
	if PlayerData.boss_dead:
		if spawning_hat:
			spawn_hat()
			spawning_hat = false
		

	if PlayerData.level == 1:
		while enemy_num < 6:
			enemy_num+=1
			_spawn_enemy()
		if PlayerData.score == 6:
			PlayerData.level +=1
			enemy_num = 0
	if PlayerData.level == 2:
		while enemy_num< 8:
			enemy_num +=1
			_spawn_enemy()
		if PlayerData.score == 14:
			PlayerData.level +=1
			enemy_num = 0
	if PlayerData.level == 3:
		while enemy_num <10:
			enemy_num+=1
			_spawn_enemy()
		if PlayerData.score == 24:
			if !spawn:
				_boss_spawn()
			spawn = true
			PlayerData.level = 0
			PlayerData.set_boss(true)
	pass # Replace with function body.
