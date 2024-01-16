extends Node2D

var tween : Tween

@onready var bullet_scene = load("res://Scenes/Bullet.tscn")
@onready var player = get_parent().get_parent().get_node("Player")

var type = "ENEMY"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.set_wait_time(.6)
	$Timer.start()
	
	var _target = Vector2(position.x, 100)
	
	tween = get_tree().create_tween()
	
	tween.tween_property(self, "position", _target, 2.0).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(1 * delta)
	position.y += 50 * delta
	
	if (position.y > get_viewport_rect().size.y + 20):
		get_parent().remove_child(self)
		queue_free()


func spawn_bullets():
	var _bullet = bullet_scene.instantiate()
	
	get_parent().add_child(_bullet)
	_bullet.bullet_speed = 800
	_bullet.position = self.position
	_bullet.direction = Vector2(player.position.x - self.position.x,player.position.y - self.position.y).normalized()


func _on_timer_timeout():
	spawn_bullets()
