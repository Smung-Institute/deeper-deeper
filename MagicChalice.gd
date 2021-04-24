extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal playerhere
signal playerleft

# Called when the node enters the scene tree for the first time.
func _ready():
	$WinArea.connect("body_entered", self, "_on_WinArea_entered")
	$WinArea.connect("body_exited", self, "_on_WinArea_exited")
	
func _on_WinArea_entered(body):
	if body.is_in_group("players"):
		emit_signal("playerhere")
		_on_playerhere()
		
func _on_WinArea_exited(body):
	if body.is_in_group("players"):
		emit_signal("playerleft")
		_on_playerleft()
		

func _on_playerhere():
	print("player is near chalice!")
	
func _on_playerleft():
	print("player has left the chalice!")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
