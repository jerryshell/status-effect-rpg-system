class_name GUI
extends CanvasLayer

@export var charater: Character

@onready var stun_texture_rect: TextureRect = $StatusEffectContainer/StunTextureRect
@onready var berserk_texture_rect: TextureRect = $StatusEffectContainer/BerserkTextureRect

func _process(delta: float) -> void:
	stun_texture_rect.visible = charater.status_effect_list.any(func (item: StatusEffect): return item.name == "Stun")
	berserk_texture_rect.visible = charater.status_effect_list.any(func (item: StatusEffect): return item.name == "Berserk")
