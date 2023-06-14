extends Area2D

func _on_body_entered(body):
	body.speed_debuff = 0.9;


func _on_body_exited(body):
	body.speed_debuff = 1;
