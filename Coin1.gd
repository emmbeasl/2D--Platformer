extends Area2D

func _on_Coin1_body_entered(body):
	queue_free()
