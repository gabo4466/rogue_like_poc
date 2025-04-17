class_name Player
extends CharacterBody2D

@export var speed: float = 100.0
var direction := Vector2.ZERO

func _physics_process(delta: float) -> void:
	direction = Vector2.ZERO

	# trash code
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()


	if direction != Vector2.ZERO:
		$AnimatedSprite2D.play("walking")
	else:
		$AnimatedSprite2D.play("idle")
