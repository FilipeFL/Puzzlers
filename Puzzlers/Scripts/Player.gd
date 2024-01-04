extends CharacterBody2D

@export var max_speed = 300
@export var accelaration = 1500
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
	# Old player movement by the mouse position
	# self.position = get_global_mouse_position()
	
	axis = _get_input_axis()
	
	if (axis == Vector2.ZERO):
		pass # TODO: Apply friction
	else:
		pass # TODO: Apply movement
	
	move_and_slide()
	
	if (Input.is_action_just_pressed("Shoot")):
		var _bullet = player_bullet.instantiate()
		
		get_parent().add_child(_bullet)
		_bullet.position = self.position


func _physics_process(delta):
	pass


func _get_input_axis():
	axis.x = int(Input.is_action_pressed("Move_Right")) - int(Input.is_action_pressed("Move_Left"))
	axis.y = int(Input.is_action_pressed("Move_Down")) - int(Input.is_action_pressed("Move_Up"))

func _player_status():
	get_parent().get_node("Label").text = get_parent().health_status[health]
