extends Node2D

var enemy_scene = load("res://Scenes/Enemy.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.set_wait_time(1)
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var _enemy = enemy_scene.instantiate()
	
	randomize()
	_enemy.position.x = randf_range(50, 910)
	_enemy.position.y = -100
	
	add_child(_enemy)
