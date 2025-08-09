extends Node

@onready var remote_transform = %RemoteTransform2D
@onready var camera = %Camera

func _ready() -> void:
	var genesis = get_child(0)
	genesis.active = true
	for bingobanjo in get_children():
		bingobanjo.connect("activated", _on_bingobanjo_activated)
	remote_transform.reparent(genesis)
	remote_transform.remote_path = camera.get_path()

func _process(delta: float) -> void:
	var furthest: float = 0
	var furthest_bingobanjo: Node = $Bingobanjo
	for bingobanjo in get_children():
		if bingobanjo.position.x > furthest and bingobanjo.active:
			furthest = bingobanjo.position.x
			furthest_bingobanjo = bingobanjo
	if remote_transform.get_parent() != furthest_bingobanjo:
		remote_transform.reparent(furthest_bingobanjo)
		remote_transform.global_position = furthest_bingobanjo.global_position
		remote_transform.remote_path = camera.get_path()

func _on_bingobanjo_activated():
	print("aa")
	camera.get_node("Camera").zoom -= Vector2(0.05,0.05)
