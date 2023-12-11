extends Node2D

var enemy_scene = load("res://Scenes/Enemy.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var _enemy = enemy_scene.instantiate()
	
	randomize()
	_enemy.position.x = randf_range(100, 1000)
	
	add_child(_enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
