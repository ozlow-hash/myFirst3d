extends Node3D

@export var bullet_speed: float = 25.0
@export var bullet_scene = preload("res://assets/bullet.tscn")
@onready var muzzle = $"../Marker3D"
@onready var camera_dir = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
		
func shoot():
	var aim_dir = camera_dir.global_transform.basis.z
	var bullet = bullet_scene.instantiate()
	
	bullet.global_transform = muzzle.global_transform
	get_tree().current_scene.add_child(bullet)
	
	bullet.linear_velocity = -muzzle.global_transform.basis.z * bullet_speed
	print(aim_dir)
