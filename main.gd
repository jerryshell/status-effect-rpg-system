extends Node2D

@onready var character: Character = $Character

func _unhandled_key_input(event: InputEvent) -> void:
	event = event as InputEventKey
	if not event.is_pressed():
		return
	if event.keycode == KEY_1:
		var stun = Stun.new(3)
		character.apply_status_effect(stun)
	elif event.keycode == KEY_2:
		var berserk = Berserk.new(3)
		character.apply_status_effect(berserk)
