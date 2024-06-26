extends TextureButton
@onready var sprite = $"Opcion A"
@onready var label = $"Opcion A/Dial"

func _on_mouse_entered():
	label.self_modulate = Color(1, 1, 1, 0.5)
	sprite.self_modulate = Color(1, 1, 1, 0.5)


func _on_mouse_exited():
	sprite.self_modulate = Color(1, 1, 1, 1)
	label.self_modulate = Color(1, 1, 1, 1)


func _on_button_up():
	sprite.self_modulate = Color(1, 1, 1, 1)
	label.self_modulate = Color(1, 1, 1, 1)
	pass # Replace with function body.
