class_name BeerBottle
extends Node2D

@export var speed: float
@export var rotational_speed: float

func _ready() -> void:
	rotation = randf_range(0, 360)
	speed = randf_range(500, 900)
	rotational_speed = randf_range(1, 5)


func _physics_process(delta: float) -> void:
	global_position.x += speed * delta
	rotation += rotational_speed * delta


func _on_life_timer_timeout() -> void:
	queue_free()
