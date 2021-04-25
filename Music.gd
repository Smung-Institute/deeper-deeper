extends Node

onready var p1 = get_node("../Map/Person1")
onready var p2 = get_node("../Map/Person2")

onready var music_layers = get_children()


func _ready():
	_music_finished()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_next_track():
	var indices_to_play = [0]
	var min_dist = null
	for player in [p1, p2]:
		var index_to_play = 0
		for i in range(len(music_layers)):
			var dist = player.position.distance_to(music_layers[i].position) 
			if (min_dist == null) or (dist < min_dist):
				index_to_play = i
				min_dist = dist
		indices_to_play.append(index_to_play)
	return music_layers[indices_to_play.max()].get_children()[0]
			
func _music_finished():
	var to_play = get_next_track()
	to_play.play()
	to_play.connect("finished", self, "_music_finished")
