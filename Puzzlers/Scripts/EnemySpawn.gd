extends Node2D

var enemy_scene = load("res://Scenes/Enemy.tscn")
var enemy_timer = 1
var enemy_count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.set_wait_time(enemy_timer)
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (enemy_count >= 10):
		enemy_timer += 2
		$Timer.set_wait_time(enemy_timer)
	else:
		enemy_timer = 1
		$Timer.set_wait_time(enemy_timer)


func _on_timer_timeout():
	var _enemy = enemy_scene.instantiate()
	
	randomize()
	_enemy.position.x = randf_range(50, 910)
	_enemy.position.y = -100
	
	enemy_count += 1
	
	add_child(_enemy)
