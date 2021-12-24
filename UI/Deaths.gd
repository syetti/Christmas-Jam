extends Label

func update_deaths() -> void:
	set_text("Deaths: " + str(PlayerData.deaths))


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if PlayerData.boss_spawn == true:
		queue_free()
	update_deaths()