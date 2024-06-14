extends TextureButton

@onready var Boton = $Label

func _on_mouse_entered():
	Boton.self_modulate = Color(1, 1, 1, 0.5)

func _on_mouse_exited():
	Boton.self_modulate = Color(1, 1, 1, 1)

