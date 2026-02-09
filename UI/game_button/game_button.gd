class_name GameButton
extends Button

@export var button_text: String

@onready var label: Label = $Label

func _ready() -> void:
	label.text = button_text


func button_interaction() -> void:
	pass


func _on_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), .1)
	tween.tween_property(self, "scale", Vector2(1, 1), .1)
	button_interaction()
