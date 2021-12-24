extends Node2D

var deaths := 0 setget set_deaths
var score := 0 setget set_score
var level := 1 setget set_level
var boss_spawn :bool = false setget set_boss
signal score_updated
signal player_died

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func reset_score():
	score = 0

func reset_level():
	level = 0

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

func set_boss(value:bool):
	boss_spawn = value


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
