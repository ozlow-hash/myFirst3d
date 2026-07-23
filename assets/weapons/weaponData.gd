class_name WeaponData
extends Resource

@export_category("Identification")
@export var weapon_name: String = "Weapon"

@export_category("Scenes")
# The scene for the weapon when it's equipped
@export var weapon_equipped_scene: PackedScene

@export var weapon_pickup_scene: PackedScene

@export_category("Ammunition")
@export var max_magazine_capacity: int = 1
@export var max_total_ammo: int = 1
@export var reload_time: float = 2.0
@export var uses_ammo: bool = true

var current_magazine_ammo: int
var total_ammo: int
var is_reloading: bool = false

@export_category("Stats")
@export var damage: int = 25

@export_category("Feel")
@export var recovery_speed: float = 7.0
# We will create WeaponImpact and CrosshairData resources later
# @export var impacts: Array[WeaponImpact]
# @export var muzzle_flash_scene: PackedScene

@export_category("Recoil")
@export var recoil_kickback: float = 0.1
@export var recoil_rotation_degrees: Vector3 = Vector3(-5, 2, 0)
@export var recoil_impact_multiplier: float = 1.0
@export var recovery_delay: float = 0.0

@export_category("Wall Collision")
@export var retract_distance: float = 0.5
@export var retract_lerp_speed: float = 30.0

@export_category("Melee Specific")
@export var slash_lunge_distance: float = -0.3
@export var slash_rotation_degrees: Vector3 = Vector3(30, 0, -15)
@export var slash_duration: float = 0.1
@export var return_duration: float = 0.2

@export_category("Projectile Specific")
# @export var projectile_scene: PackedScene
@export var projectile_launch_force: float = 20.0

# @export_group("Visuals")
# @export var crosshair_data: CrosshairData

func init_ammo() -> void:
	current_magazine_ammo = max_magazine_capacity
	total_ammo = max_total_ammo
	is_reloading = false
