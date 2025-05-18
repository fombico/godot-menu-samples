extends Node

# Based on https://www.youtube.com/watch?v=PbWtdMQO5jc
@export_range(0, 59) var seconds: int = 0
@export_range(0, 59) var minutes: int = 0
@export_range(0, 999) var hours: int = 0 

signal game_clock_time_elapsed

var delta_time: float = 0

func _process(delta: float) -> void:
	delta_time += delta
	if delta_time < 1:
		return
	
	var delta_int_sec: int = delta_time
	delta_time -= delta_int_sec
	
	seconds += delta_int_sec
	minutes += seconds / 60
	hours += minutes / 60
	
	seconds %= 60
	minutes %= 60
	
	game_clock_time_elapsed.emit(hours, minutes, seconds)

func to_save_data() -> GameClockData:
	var game_clock_data = GameClockData.new()
	game_clock_data.elapsed_hours = hours
	game_clock_data.elapsed_minutes = minutes
	game_clock_data.elapsed_seconds = seconds
	return game_clock_data

func from_save_data(game_clock_data: GameClockData) -> void:
	hours = game_clock_data.elapsed_hours
	minutes = game_clock_data.elapsed_minutes
	seconds = game_clock_data.elapsed_seconds
	game_clock_time_elapsed.emit(hours, minutes, seconds)
