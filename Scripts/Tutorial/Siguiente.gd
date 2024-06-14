extends TextureButton
@onready var Boton = $Siguiente2
@onready var Blabel = $Siguiente2/Dial
@onready var Texto = $"../TextoNubes/NubeSecretaria/SusanaDialogo"
@onready var SpriteMujer = $"../MujerOficina"
@onready var SpriteHombre = $"../HombreOficina"
@onready var Flecha1 = $"../Flechas/Flecha Icono"
@onready var Flecha2 = $"../Flechas/Flecha Dialogo"
@onready var Flecha3 = $"../Flechas/Flecha Ganacia"
@onready var Flecha4 = $"../Flechas/Flecha Empleados"
@onready var Flecha5 = $"../Flechas/Flecha dinero"
var indice_tutorial = 0

func _ready():
	OcultarTodo()
	if Main.genero == 2:
		SpriteMujer.visible = true
	else:
		SpriteHombre.visible = true
	
func _on_pressed():
	indice_tutorial += 1
	cambiarDialogo()
	if indice_tutorial > 5:
		get_tree().change_scene_to_file("res://Scenas/escena_oficina.tscn")

func cambiarDialogo():
	match indice_tutorial:
		1:
			Texto.text = "Aqui tenemos el dialogo, cada cosa que suceda podras atenderla tranquilamente, pero ahora"
			OcultarTodo()
			Flecha1.visible = true
		2:
			Texto.text = "Aqui tenemos la felicidad, es importante mantenerla porque si nadie te respeta no seran productivos !!"
			OcultarTodo()
			Flecha2.visible = true
		3:
			Texto.text = "Aqui tenemos la cantidad de empleados a tu disposicion, cada uno es importante asi que no dejes que se vayan"
			OcultarTodo()
			Flecha3.visible = true
		4:
			Texto.text = "Aqui tenemos el Dinero, es lo mas importante para mantener todo a flote"
			OcultarTodo()
			Flecha4.visible = true
		5:
			Texto.text = "Eso seria todo, tiempo de comenzar tu dia"
			OcultarTodo()
			
		
func _on_mouse_entered():
	Boton.self_modulate = Color(1, 1, 1, 0.5)
	Blabel.self_modulate = Color(1, 1, 1, 0.5)

func _on_mouse_exited():
	Boton.self_modulate = Color(1, 1, 1, 1)
	Blabel.self_modulate = Color(1, 1, 1, 1)
	
func OcultarTodo():
	Flecha1.visible = false
	Flecha2.visible = false
	Flecha3.visible = false
	Flecha4.visible = false
	Flecha5.visible = false
	
