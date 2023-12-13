extends Node2D

var direction = Vector2(1,0)

@export var bullet_speed = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += direction * delta * bullet_speed
	
	if ($RayCast2D.is_colliding()):
		var _collide = $RayCast2D.get_collider().get_parent()
		if (_collide.type == "PLAYER"):
			position += Vector2(2000.0,2000.0)
			
			if (_collide.health > 0):
				_collide.health -= 1
				_collide._player_status()


func _screen_exited():
	queue_free()
