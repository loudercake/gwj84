extends Area2D

@onready var camera = %Camera

func _on_area_entered(area: Area2D) -> void:
	camera.get_node("Camera").zoom = Vector2(1,1) # Replace with function body.
