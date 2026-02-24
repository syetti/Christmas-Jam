extends Node2D

var boss_spawned :bool = false
var desired_level_score = 0
var enemy_levels = [3,5,15,20]
var enemies_spawned = false

func _spawn_enemy():
	var enemy = preload("res://Enemies/enemies.tscn").instantiate()
	add_child(enemy)
	enemy.set_position(Vector2(randf_range(10,300), randf_range(50,100)))
	
	
func _boss_spawn():
	var boss = preload("res://Enemies/bigboss.tscn").instantiate()
	add_child(boss)
	boss_spawned = true
var spawning_hat = true


func _ready():
	
	set_process(true)
	

func spawn_hat():
	var hat = preload("res://Hat.tscn").instantiate()
	$".".add_child(hat)
	
	
func spawn_round():
	
	if PlayerData.global_enemy_num > 0: 
		return
	
	if PlayerData.level >= enemy_levels.size():
		if not boss_spawned:
			_boss_spawn()
			PlayerData.level = 0
			PlayerData.set_boss(true)
		return
		
	if PlayerData.level < enemy_levels.size()+1:
		var num_to_spawn = enemy_levels[PlayerData.level]
		PlayerData.global_enemy_num = num_to_spawn
		for i in num_to_spawn:
			_spawn_enemy()
			enemies_spawned = true
			
	
		
func _process(_delta):
	if PlayerData.global_enemy_num <= 0 and enemies_spawned:
		PlayerData.level += 1
		enemies_spawned = false
	
	if not boss_spawned:
		spawn_round()
	
	if PlayerData.boss_dead:
		if spawning_hat:
			spawn_hat()
			spawning_hat = false
	
	pass # Replace with function body.
