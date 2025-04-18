extends Node

const MENU_SCENE = preload("res://scenes/menu/menu.tscn")
const LEVEL_1 = preload("res://scenes/level_1/level_1.tscn")

var current_scene: Node

func _ready():
	_load_scene(MENU_SCENE)

func _load_scene(scene_packed: PackedScene) -> void:
	if current_scene:
		current_scene.queue_free()
	current_scene = scene_packed.instantiate()
	add_child(current_scene)
	
	if current_scene.is_in_group("menu"):
		config_menu_scene(current_scene)
	elif current_scene.is_in_group("level"):
		print("Loaded a level scene")

func start_game():
	_load_scene(LEVEL_1)

func config_menu_scene(scene: Node):
	scene.start_game_button_pressed.connect(start_game)
