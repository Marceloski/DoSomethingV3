extends Node2D
signal sube
signal ocultar
signal revelar
signal subidaEnd
@onready var Ganacias = $Cuaderno/Ganancias
@onready var Empleados = $Cuaderno/Empleados
@onready var Felicidad = $Cuaderno/Felicidad
@onready var anim = $AnimationPlayer
var dineroMaximo
var empleadosMaximo
var felicidadMaxima
var dineroFinal
var empleadosFinal
var felicidadFinal

func _ready():
	Lector()

func _process(delta):
	Actu()
	
func Lector():
	dineroMaximo = Main.Dinero
	empleadosMaximo = Main.Empleados
	felicidadMaxima = Main.Felicidad
	
func Resumidor():
	dineroFinal = Main.Dinero - dineroMaximo
	empleadosFinal = Main.Empleados - empleadosMaximo
	felicidadFinal = Main.Felicidad - felicidadMaxima
	
func Restarter():
	empleadosFinal = 0
	dineroFinal = 0
	felicidadFinal = 0
	dineroMaximo = 0
	empleadosMaximo = 0
	felicidadMaxima = 0
	
func Actu():
	Ganacias.text = "Ganancias: "+ str(dineroFinal)
	Empleados.text = "Empleados: "+ str(empleadosFinal)
	Felicidad.text = "Felicidad: "+ str(felicidadFinal)

func _on_animation_player_animation_started(anim_name):
	if anim_name == "baja":
		Resumidor()
		emit_signal("ocultar")
		print("ASD")
	if anim_name == "sube":
		emit_signal("revelar")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "sube":
		Restarter()
		Lector()
		emit_signal("subidaEnd")
		print("subio")

func _on_button_pressed():
	anim.play("sube")
	emit_signal("sube")

func _on_texto_nubes_baja():
	anim.play("baja")
