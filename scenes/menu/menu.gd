extends Control
signal start_game_button_pressed

@onready var start_button = $Panel/VBoxContainer/StartGameButton

func _ready():
	start_button.pressed.connect(_on_start_pressed)

func _on_start_pressed():
	emit_signal("start_game_button_pressed")
