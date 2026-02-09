extends Node

enum game_stats_enum {
	GOLD,
	SPEED
}

enum beer_stats_enum {
	BEER,
	SELL_PRICE,
	STOCK
}

var game_stats: Dictionary = {
	game_stats_enum.GOLD : 0
}

var beer_stats: Dictionary = {
	beer_stats_enum.BEER : 1,
	beer_stats_enum.SELL_PRICE : 1,
	beer_stats_enum.STOCK: 6
}
