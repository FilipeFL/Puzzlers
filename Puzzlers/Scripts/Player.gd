extends Node2D

var type = "PLAYER"
var health = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_global_mouse_position()


func _player_status():
	get_parent().get_node("Label").text = get_parent().health_status[health]
