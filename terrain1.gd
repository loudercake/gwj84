extends Node2D

@onready var critters = $Critters



func _input(event: InputEvent) -> void:
	if event.is_action("ui_left"):
		for critter in critters.get_children():
			critter.move_left()
	if event.is_action("ui_right"):
		for critter in critters.get_children():
			critter.move_right()
