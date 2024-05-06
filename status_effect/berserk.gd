class_name Berserk
extends StatusEffect

func _init(_duration: float) -> void:
	super._init(_duration)
	name = "Berserk"

func apply(_target: Character) -> void:
	super.apply(_target)
	target.movement_speed = 200
	target.attack_speed = 2

func process(delta: float) -> void:
	super.process(delta)

func remove() -> void:
	super.remove()
	target.movement_speed = 100
	target.attack_speed = 1
