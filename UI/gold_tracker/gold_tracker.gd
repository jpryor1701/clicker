class_name GoldTracker
extends Control

@onready var label: Label = $Label

func _ready() -> void:
	GlobalSignals.gold_update.connect(update_gold_label)
	update_gold_label()


func update_gold_label() -> void:
	var tween = create_tween()
	tween.tween_property(label, "scale", Vector2(1.3, 1.3), .1)
	tween.tween_property(label, "scale", Vector2(1, 1), .1)
	label.text = "Gold %s" % GameData.stats["gold"]
