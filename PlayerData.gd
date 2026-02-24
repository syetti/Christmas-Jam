extends Node2D

var deaths := 0: set = set_deaths
var score := 0: set = set_score
var level := 0: set = set_level
var boss_spawn :bool = false: set = set_boss
var boss_dead :bool = false: set = boss_death
var start_end: bool= false: set = start_ends
var alive:bool = true: set = player_dead
var global_enemy_num = 0
var playerpos = Vector2()
@onready var countdown_scene = preload("res://countdown.tscn")

signal score_updated
signal player_died


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.
func reset_score():
	score = 0

func reset_level():
	level = 1

func reset_deaths():
	deaths = 0

func set_score(value:int):
	score = value
	emit_signal("score_updated", value)
func set_deaths(value:int):
	deaths = value
	emit_signal("player_died", value)
func set_level(value:int):
	level = value
func player_dead(status:bool):
	alive = status
	$"/root/Main".queue_free()
	get_tree().change_scene_to_file("res://RespawnScene.tscn")
	var respwan_scene = preload("res://RespawnScene.tscn").instantiate()
	respwan_scene.get_node("AnimationPlayer").play("ENDFADE")

func set_boss(value:bool):
	countdown()
	boss_spawn = value
func boss_death(value:bool):
	boss_dead = value
func start_ends(value:bool):
	countdown()
	start_end = value
	$"/root/Main".queue_free()
	get_tree().change_scene_to_file("res://EndScreen.tscn")
	
func countdown():
	add_child(countdown_scene.instantiate())
	

func start_game():
#	get_tree().change_scene_to_file()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
