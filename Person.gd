extends RigidBody2D

var torch_scene = preload("res://Torch.tscn")

var return_position

var TORCH_COOLDOWN = 10
var last_torch_time = TORCH_COOLDOWN

var is_controlled = true
var direction = Vector2(1,0)
export var speed = 100
var velocity = Vector2(0,0)
export var rotation_rate = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("players")
	linear_velocity = Vector2(1,0) * speed
	connect("body_entered", self, "_handle_body_entered")
	$AnimatedSprite.animation = name
	return_position = position
	
func _handle_body_entered(body):
	if body.is_in_group("bat"):
		die()
	if body.is_in_group("fireball"):
		die()
	if body.is_in_group("poison"):
		die()
		
func die():
	position = return_position


func _process(delta):
	last_torch_time += delta
	if Input.is_action_just_pressed("keyboard_down"):
		if is_controlled:
			if last_torch_time > TORCH_COOLDOWN:
				var torch = torch_scene.instance()
				torch.position = position
				get_parent().add_child(torch)
				return_position = position
				last_torch_time = 0

func _physics_process(delta):
	linear_velocity = linear_velocity.normalized() * speed
	if is_controlled:
		$DirectionalArrow.show()
		rotate_arrow()
		rotate_velocity(delta)
		direction = linear_velocity.normalized()
	else:
#		velocity = Vector2(0,0)
		$DirectionalArrow.hide()
	rotation = 0
	
	$AnimatedSprite.scale.x = -sign(linear_velocity.x)
#	move(delta)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func rotate_velocity(delta):
	if Input.is_action_pressed("keyboard_left"):
		linear_velocity= linear_velocity.rotated(-rotation_rate*delta)
	if Input.is_action_pressed("keyboard_right"):
		linear_velocity= linear_velocity.rotated(rotation_rate*delta)

#func move(delta):
##	direction = velocity.normalized()
#	position += velocity * delta

#func move():
#	var direction = Vector2(0,0)
##	if Input.is_action_pressed("keyboard_down"):
##		direction += Vector2(0,1)
#	if Input.is_action_pressed("keyboard_left"):
#		direction += Vector2(-1,0)
#	if Input.is_action_pressed("keyboard_right"):
#		direction += Vector2(1,0)
##	if Input.is_action_pressed("keyboard_up"):
##		direction += Vector2(0,-1)
##	if direction != Vector2(0,0):
##		linear_velocity = direction.normalized() * speed
##		is_walking = true
##	else:
##		is_walking = false

func rotate_arrow():
	$DirectionalArrow.rotation = linear_velocity.angle()
