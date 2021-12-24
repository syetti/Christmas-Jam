extends Label

func update_levels() -> void:
	set_text("Level " + str(PlayerData.level))
	if PlayerData.boss_spawn == true:
		set_text("!BOSS Level!")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	

	update_levels()