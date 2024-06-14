extends TextureButton
@export var dinero:bool
@export var empleados:bool
@export var felicidad:bool
@onready var Sig = $Siguiente

func _on_pressed():
	if felicidad:
		Main.Felicidad -= 2
	if dinero:
		Main.Dinero -= 20
	if empleados:
		Main.Empleados -= 20

func _on_mouse_entered():
	Sig.self_modulate = Color(1, 1, 1, 0.5)
	Sig.self_modulate = Color(1, 1, 1, 0.5)

func _on_mouse_exited():
	Sig.self_modulate = Color(1, 1, 1, 1)
	Sig.self_modulate = Color(1, 1, 1, 1)
