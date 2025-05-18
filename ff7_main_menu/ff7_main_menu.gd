extends Control

@onready var _saver_loader:SaverLoader = %SaverLoader
@onready var time_text: RichTextLabel = %TimeText

func _ready() -> void:
	GameClock.connect("game_clock_time_elapsed", _on_game_clock_time_elapsed)
	$MenuPanel/VBoxContainer/Item.grab_focus()

func _on_save_pressed() -> void:
	_saver_loader.save_game()

func _on_load_pressed() -> void:
	_saver_loader.load_game()

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/samples_menu.tscn")

func _on_game_clock_time_elapsed(hours: int, minutes: int, seconds: int):
	time_text.text = "%d:%02d:%02d" % [hours, minutes, seconds]
