extends Area3D

@onready var health : int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	#check if object entering area is a bullet
	var damage = body.damage
	if body.is_in_group("bullet"):
		body.queue_free()
		health -= damage
		if health <= 0: 
			queue_free()
		#add damage here
