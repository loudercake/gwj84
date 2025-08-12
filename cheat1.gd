extends Area2D

@onready var critters = $"../Critters"

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().active:
		for critter in critters.get_children():
			critter.active = true
