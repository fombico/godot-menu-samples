class_name SaverLoader
extends Node

func save_game():
	var saved_game := SavedGame.new()

	saved_game.game_clock_data = GameClock.to_save_data()
	
	var saved_data:Array[SavedData] = []
	get_tree().call_group("game_events", "on_save_game", saved_data)
	
	saved_game.saved_data = saved_data
	
	# Note this approach has a drawback of being user editable. 
	# Based on https://www.youtube.com/watch?v=43BZsLZheA4
	ResourceSaver.save(saved_game, "user://savegame.tres")
	print("Wrote to " + OS.get_user_data_dir())

func load_game():
	var saved_game:SavedGame = load("user://savegame.tres") as SavedGame
	if saved_game == null:
		print("Saved game is null")
		return
	
	GameClock.from_save_data(saved_game.game_clock_data)
	
	# clear stage
	get_tree().call_group("game_events", "on_before_load_game")
	
	print("Found " + str(saved_game.saved_data.size()) + " items")
	
		# TODO for dynamic data, create and hydrate scenes
