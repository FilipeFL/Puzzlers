extends Node2D

var type = "PLAYER"
var health = 5
var player_bullet = load("res://Scenes/Player_Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_global_mouse_position()
	
	if (Input.is_action_just_pressed("Shoot")):
		var _bullet = player_bullet.instantiate()
		
		get_parent().add_child(_bullet)
		_bullet.position = self.position


func _player_status():
	get_parent().get_node("Label").text = get_parent().health_status[health]
