extends Area2D

@onready var critters = $"../Critters"
@onready var remote_transform = %RemoteTransform2D

func _on_area_entered(area: Area2D) -> void:
	critters.camera_following = false
	remote_transform.reparent(self)
	remote_transform.global_position = global_position
