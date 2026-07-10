extends RigidBody3D

var bullet_velocity: int = 90
var damage: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#position += transform.basis * Vector3(0, 0, -bullet_velocity) * delta
	await get_tree().create_timer(2.5).timeout
	queue_free()
