extends Node2D
signal go
signal ocultarhogar 
@onready var BS = $TextureButton/Sprite2D
@onready var BL = $TextureButton/Label
@onready var anim = $AnimationPlayer
@onready var boton = $TextureButton

func _ready():
	boton.visible = false 
	
func _on_cuaderno_sube():
	emit_signal("go")

func _on_texture_button_pressed():
	emit_signal("ocultarhogar")

func _on_texture_button_mouse_entered():
	BS.self_modulate = Color (1, 1, 1, 0.5)
	BL.self_modulate = Color (1, 1, 1, 0.5)

func _on_texture_button_mouse_exited():
	BS.self_modulate = Color (1, 1, 1, 1)
	BL.self_modulate = Color (1, 1, 1, 1)

func _on_notas_aparece():
	boton.visible = true
	anim.play("aparecer")

func _on_texto_nubes_animacion_go():
	boton.visible = false
