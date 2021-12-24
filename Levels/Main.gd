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

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

func _process(_delta):
	while enemy_num < 6 && PlayerData.score <6:
		enemy_num+=1
		_spawn_enemy()
	if PlayerData.score == 6:
		_boss_spawn()
		print("gribble")
		PlayerData.score +=1
	pass # Replace with function body.
