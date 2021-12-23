extends Label

func update_score() -> void:
	set_text("Kills: " + str(PlayerData.score))


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	update_score()
