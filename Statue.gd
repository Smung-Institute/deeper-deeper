extends StaticBody2D

var FIREBALL_FREQUENCY = 2

var fireball_scene = preload("res://Fireball.tscn")

var time_start = 0
var ready_to_shoot = true

func _ready():
	time_start = OS.get_unix_time()

func _process(delta):
	if (OS.get_unix_time() - time_start)%FIREBALL_FREQUENCY == 1:
		if ready_to_shoot:
			shoot()
			ready_to_shoot = false
	else:
		ready_to_shoot = true
	
	
func shoot():
	var fireball = fireball_scene.instance()
	fireball.position = position
	fireball.scale = scale
	get_parent().add_child(fireball)	
