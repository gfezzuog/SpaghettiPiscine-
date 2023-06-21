extends Node2D

@onready var Canvas = $CanvasLayer
@onready var Player = $player
@onready var Death = preload("res://Death.tscn")

func _process(delta):

	print(Player.velocity.length());
	Canvas.texture.value = float(Canvas.texture.value) - (Player.velocity.length() * 0.01);
	Canvas.texture.value = float(Canvas.texture.value) + Player.hunger;
	if(Player.hunger != 0):
		Player.hunger = 0;
	if(Canvas.texture.value <= 0):
		Player.queue_free();
		var poggers = Death.instantiate();
		get_parent().add_child(poggers);
		queue_free();

