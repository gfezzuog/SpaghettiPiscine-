extends Area2D

func _on_body_entered(body):
	body.hunger += 1000;
	queue_free();

