extends Node3D

@export var bullet_speed: float = 25.0
@export var bullet_scene = preload("res://assets/bullet.tscn")
@onready var muzzle = $"../Marker3D"
@onready var camera_dir = $".."

@export var weapons: Dictionary[int, WeaponData]= {}

#loading starting guns
@export var cylinderGun = preload("res://assets/weapons/cylindergun.tres")
@export var rectangleGun = preload("res://assets/weapons/RectangleGun.tres")

@export var startingweapon = cylinderGun
var currentweapon = startingweapon 

var weaponname: String = currentweapon.weapon_name #NOTE: THis does not seem to be updating correctly

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func switchweapon():
	if currentweapon == startingweapon :
		print ("success")
		currentweapon = rectangleGun
		print (weaponname)

func shoot():
	var aim_dir = camera_dir.global_transform.basis.z
	var bullet = bullet_scene.instantiate()
	
	bullet.global_transform = muzzle.global_transform
	get_tree().current_scene.add_child(bullet)
	
	bullet.linear_velocity = -muzzle.global_transform.basis.z * bullet_speed
	print(currentweapon.weapon_name)

func _on_proto_controller_weaponswitch() -> void:
	switchweapon()
	#print(currentweapon)
