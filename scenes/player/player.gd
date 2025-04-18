class_name Player
extends CharacterBody2D

@export var speed: float = 300.0
var direction := Vector2.ZERO

func _ready():
	add_to_group("player")

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")

	$AnimatedSprite2D.flip_h = direction.x < 0
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()


	if direction != Vector2.ZERO:
		$AnimatedSprite2D.play("walking")
	else:
		$AnimatedSprite2D.play("idle")
