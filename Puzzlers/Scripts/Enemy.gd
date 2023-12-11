extends Node2D

@onready var bullet_scene = load("res://Scenes/Bullet.tscn")
@onready var player = get_parent().get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.set_wait_time(.6)
	$Timer.start()
	
	# TODO: Try to understand how to use Tweening in Godot 4.0
	#get_tree().create_tween().bind_node(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	## Rotation may vary with the level development
	rotate(1 * delta)
	position.y += 200 * delta


func spawn_bullets():
	## Used to make sure that the bullets will be instantiated near the enemy, following its rotation
	var _bullet = bullet_scene.instantiate()
	_bullet.position = self.position
	_bullet.direction = Vector2(player.position.x - self.position.x,player.position.y - self.position.y).normalized()
	
	get_parent().add_child(_bullet)


func _on_timer_timeout():
	#print("Timer Timeout")
	spawn_bullets()
