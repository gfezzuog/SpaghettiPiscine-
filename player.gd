extends CharacterBody2D

var dir:Vector2 = Vector2.ZERO;
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@onready var image = $AnimatedSprite2D;

func _physics_process(_delta):

	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left");
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up");
	velocity.x = lerp(velocity.x, dir.x * speed, _delta);
	velocity.y = lerp(velocity.y, dir.y * speed, _delta);
	if(image.is_playing() and abs(velocity.x) < 0.2 and abs(velocity.y) < 0.2) :
		image.stop();
	move_and_slide();

func _input(event):
	if(event is InputEventKey and event.is_pressed()):
		if(event.keycode == KEY_UP):
			image.play("Up");
		elif (event.keycode == KEY_DOWN):
			image.play("Down");
		elif (event.keycode == KEY_RIGHT):
			image.play("Right");
		elif (event.keycode == KEY_LEFT):
			image.play("Left");
	elif (event is InputEventKey):
		if(dir.x == 0 and dir.y == 0) :
			image.pause();
