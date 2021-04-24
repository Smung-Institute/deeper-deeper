extends StaticBody2D

var fireball_scene = preload("res://Fireball.tscn")

var time_start = 0
var time_now = 0

func _ready():
	time_start = OS.get_unix_time()
	var fireball = fireball_scene.instance()

	add_child(fireball)	
	
