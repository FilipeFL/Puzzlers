extends Node2D

var direction = Vector2(1,0)
@export var bullet_speed = 400


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += direction * delta * bullet_speed
	
	if ($RayCast2D.is_colliding()):
		print("Hit!")


func _screen_exited():
	queue_free()
