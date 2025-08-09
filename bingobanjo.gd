extends RigidBody2D

const colors = [
	Color("#800080"),
	Color("#00AA00"),
	Color("FFFF00")
]

const speed = 200

@onready var body = $body
@onready var eyes = $Eyes

var body_type: int # represents the even frame in the spritesheet that represents the body part
var eyes_type: int

signal activated
var active = false

var color_index = randi_range(0,len(colors)-1)

func _ready():
	body_type = randi_range(0,4)
	if body_type % 2 == 1:
		body_type += 1
	eyes_type = randi_range(0,6)
	if eyes_type % 2 == 1:
		eyes_type += 1
	while true:
		await get_tree().create_timer(0.5).timeout
		animate()
		
func animate(): # does a baba is you esque sprite movement
	if body_type % 2 == 0:
		body_type += 1
		eyes_type += 1
	else:
		body_type -= 1
		eyes_type -= 1

func _process(delta: float) -> void:
	if active:
		body.modulate = colors[color_index]
	else: 
		body.modulate = Color(0.5,0.5,0.5)
	body.frame = body_type
	eyes.frame = eyes_type

func move_left():
	if active:
		apply_central_force(Vector2(-speed,0))

func move_right():
	if active:
		apply_force(Vector2(speed,0))


func _on_activator_area_entered(area: Area2D) -> void:
	if !active and area.get_parent().active:
		active = true
		emit_signal("activated")
