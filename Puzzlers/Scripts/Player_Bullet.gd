extends Node2D

var direction = Vector2(0,1)

@export var bullet_speed = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position -= direction * delta * bullet_speed


func _screen_exited():
	queue_free()
