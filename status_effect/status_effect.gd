class_name StatusEffect
extends Resource

var name: String
var duration: float
var target: Character

func _init(_duration: float) -> void:
	duration = _duration

func apply(_target: Character) -> void:
	target = _target
	pass

func process(delta: float) -> void:
	if delta <= 0:
		return
	duration -= delta
	if duration <= 0:
		remove()

func remove() -> void:
	pass
