extends Area2D

func _on_Portal_body_entered(body):
	get_tree().change_scene("Level 2.tscn")
