extends Control
signal Cerrar
@onready var anim = $AnimationPlayer
@onready var Cajacerrar = $CerrarOpcion

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.





func _on_salir_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_atras_cerrar_pressed():
	anim.play("Subida")
	pass # Replace with function body.

func _on_boton_salida_menu_pressed():
	anim.play("Bajada")
	pass # Replace with function body.


func _on_salir_genero_pressed():
	anim.play("Bajada")
	pass # Replace with function body.


func _on_salida_oficina_pressed():
	anim.play("Bajada")
	pass # Replace with function body.
