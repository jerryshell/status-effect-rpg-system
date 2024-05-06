class_name Character
extends CharacterBody2D

@onready var weapon_animation_player: AnimationPlayer = $WeaponAnimationPlayer

var movement_speed := 100.0
var attack_speed := 1.0:
	set(value):
		attack_speed = value
		weapon_animation_player.speed_scale = value

var status_effect_list := []

func _physics_process(delta: float) -> void:
	_process_movement(delta)
	_process_status_effect(delta)

func _process_movement(delta: float) -> void:
	if global_position.y > 500:
		movement_speed = -abs(movement_speed)
	elif global_position.y < 200:
		movement_speed = abs(movement_speed)
	velocity.y = movement_speed
	move_and_slide()

func _process_status_effect(delta: float) -> void:
	var need_clean = false
	for status_effect in status_effect_list:
		status_effect = status_effect as StatusEffect
		status_effect.process(delta)
		need_clean = need_clean or status_effect.duration <= 0
	if need_clean:
		status_effect_list = status_effect_list.filter(func (item: StatusEffect): return item.duration > 0)
		# re apply
		for status_effect in status_effect_list:
			status_effect = status_effect as StatusEffect
			status_effect.apply(self)

func apply_status_effect(status_effect: StatusEffect) -> void:
	status_effect.apply(self)
	# hanle same effect
	for item in status_effect_list:
		item = item as StatusEffect
		if item.name == status_effect.name:
			item.duration = max(item.duration, status_effect.duration)
			return
	status_effect_list.append(status_effect)
