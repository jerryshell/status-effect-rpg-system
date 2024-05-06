class_name Stun
extends StatusEffect

func _init(_duration: float) -> void:
	super._init(_duration)
	name = "Stun"

func apply(_target: Character) -> void:
	super.apply(_target)
	target.movement_speed = 0
	target.attack_speed = 0

func process(delta: float) -> void:
	super.process(delta)

func remove() -> void:
	super.remove()
	target.movement_speed = 100
	target.attack_speed = 1
