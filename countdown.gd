extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	$Timer.wait_time = 4
	$Timer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_tree().paused = true
	$CanvasLayer/Label.text = str(int($Timer.time_left))
	
	if $Timer.time_left < 1:
		$Timer.stop()
		queue_free()
		get_tree().paused = false
		
