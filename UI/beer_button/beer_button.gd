extends Button

@export var amount_of_beers: int
@export var sell_price: int


@onready var label: Label = $Label

func _ready() -> void:
	GlobalSignals.upgrade_beer_amount.connect(update_label)
	update_label()
	pass


func _on_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), .1)
	tween.tween_property(self, "scale", Vector2(1, 1), .1)

	GameData.stats["gold"] += GameData.beer_stats["sell_price"] * GameData.beer_stats["beers"]
	GlobalSignals.gold_update.emit()


func update_label() -> void:
	label.text = "Sell %s beer" % GameData.beer_stats["beers"] \
		if GameData.beer_stats["beers"] == 1 \
		else "Sell %s beers" % GameData.beer_stats["beers"]
