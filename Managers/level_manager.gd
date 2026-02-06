class_name LevelManager
extends Node2D



@onready var spawner: Marker2D = $Spawner
@onready var beer_bottle: PackedScene = preload("res://Scenes/beer_bottle/beer_bottle.tscn")


func _on_button_pressed() -> void:
	for bottle in GameData.beer_stats["beers"]:
		var new_beer_bottle = beer_bottle.instantiate()
		add_child(new_beer_bottle)
		new_beer_bottle.global_position = Vector2(spawner.global_position.x, spawner.global_position.y + randf_range(-100, 100))
