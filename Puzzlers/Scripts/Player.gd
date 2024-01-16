extends Node2D

@export var max_speed = 300
@export var acceleration = 1500
@export var friction = 1200

@onready var axis = Vector2.ZERO

var type = "PLAYER"
var health = 5
var player_bullet = load("res://Scenes/Player_Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_global_mouse_position()


func _player_status():
	get_parent().get_node("Label").text = get_parent().health_status[health]
