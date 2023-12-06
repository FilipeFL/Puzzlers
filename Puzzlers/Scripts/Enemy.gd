extends Node2D

var bullet_scene = load("res://Scenes/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(.05)
	
	var bullet = bullet_scene.instantiate()
	bullet.position = self.position
	bullet.rotation = self.rotation
	bullet.position.x += 100
	
	get_parent().add_child(bullet)
