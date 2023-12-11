extends Node2D

var bullet_scene = load("res://Scenes/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	## Rotation may vary with the level development
	rotate(.1)
	
	## Used to make sure that the bullets will be instantiated near the enemy, following its rotation
	var bullet = bullet_scene.instantiate()
	bullet.position = self.position
	bullet.rotation = self.rotation
	
	get_parent().add_child(bullet)
