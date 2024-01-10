extends Node2D

var direction = Vector2(0,1)

@export var bullet_speed = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position -= direction * delta * bullet_speed
	
	if ($RayCast2D.is_colliding()):
		var _collide = $RayCast2D.get_collider().get_parent()
		if (_collide.type == "ENEMY"):
			position += Vector2(2000.0,2000.0)
			_collide.position += Vector2(2000.0,2000.0)


func _screen_exited():
	queue_free()
