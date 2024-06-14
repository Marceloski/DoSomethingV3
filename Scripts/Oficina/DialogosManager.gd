extends Node2D
signal baja
signal perder
signal ganar
signal animacionGo
signal byebye
#Labels
@onready var Npcs = $"../Escenario/Celeste/FondoOficina/Npc"
@onready var Hogar = $"../Hogar"
@onready var MainLabel = $NubeSecretaria/SusanaDialogo
@onready var CashLabel = $LabelsStats/VBoxContainer/Dinero
@onready var HappyLabel = $"LabelsStats/Felicidad"
@onready var Ganancias = $LabelsStats/Ganancias
@onready var EmpleadosLabel = $LabelsStats/VBoxContainer/Empleados
@onready var ConsecuenciaLabel = $Consecuencia/ConsecuenciaDialogo
@onready var OpcionA = $"../Botones/OpcionA/Opcion A/Dial"
@onready var OpcionB = $"../Botones/OpcionB/Opcion B/Dial"
@onready var OpcionC = $"../Botones/OpcionC/Opcion C/Dial"
var perdimos = false
var ganamos = false
var currentText
var dialogo_id = 1
var click = 0
var stop = false
var npcActual 

func _ready():
	ocultarConsecuencia()

func _process(delta):
	coordinadorLabels()
	mostrar_dialogo(dialogo_id)
	if !perdimos:
		welose()
	if !ganamos:
		wewin()
	
func tomarOpcion(index):
	var dialogo = get_ide(dialogo_id)
	if dialogo:
		var opciones = dialogo["optiones"]
		if opciones and index < opciones.size():
			var opcion = opciones[index]
			aplicar_debuffos(opcion)

func aplicar_debuffos(opcion):
	if opcion.has("felicidad"):
		Main.Felicidad += opcion["felicidad"]
	if opcion.has("dinero"):
		Main.Dinero += opcion["dinero"]
	if opcion.has("empleados"):
		Main.Empleados += opcion["empleados"]
	if opcion.has("consecuencia"):
		ConsecuenciaLabel.text = opcion["consecuencia"]

#Actualiza los marcadores
func coordinadorLabels():
	if Main.Felicidad > 10:
		Main.Felicidad = 10
	if Main.Felicidad < 0:
		Main.Felicidad = 0
	if Main.Empleados <= 0:
		Main.Empleados = 0
	if Main.Dinero >= 1000:
		Main.Dinero = 1000
	EmpleadosLabel.text = str(Main.Empleados)
	Ganancias.text = str(Main.Ganancias)
	HappyLabel.text = str(Main.Felicidad)
	CashLabel.text = "$"+str(Main.Dinero)
	
func mostrar_dialogo(Ide):
	Ide = dialogo_id
	var dialogo = get_ide(Ide)
	if dialogo:
		MainLabel.text = dialogo["text"]
	if dialogo.has("optiones"):
		var options = dialogo["optiones"]
		OpcionA.text = options[0]["text"]
		OpcionB.text = options[1]["text"]
		OpcionC.text = options[2]["text"]
	else:
		print("Sin Dialogo")
	if dialogo.has("npc"):
		npcActual = dialogo["npc"]
	
func get_ide(id):
	for dialogue in Main.dialogues:
		if dialogue["id"] == id:
			return dialogue
	return null 

func _on_siguiente_pressed():
	dialogo_id = randi_range(1, 7)
	click += 1
	revelarOpcionesProblema()
	ocultarConsecuencia()
	if click % 5 == 0:
		Cuadernon()
	print(dialogo_id)
	cambiarNpc()
	
func _on_opcion_a_pressed():
	tomarOpcion(0)
	ocultarOpcionesProblema()
	revelarConsecuencia()
	emit_signal("byebye")

func _on_opcion_b_pressed():
	tomarOpcion(1)
	ocultarOpcionesProblema()
	revelarConsecuencia()
	emit_signal("byebye")

func _on_opcion_c_pressed():
	tomarOpcion(2)
	ocultarOpcionesProblema()
	revelarConsecuencia()
	emit_signal("byebye")

#region Ocultador
func ocultarConsecuencia():
	$Consecuencia.visible = false
	$"../Siguiente".visible = false

func revelarConsecuencia():
	$Consecuencia.visible = true
	$"../Siguiente".visible = true

func ocultarOpcionesProblema():
	MainLabel.visible = false
	$"../Botones".visible = false
	
func revelarOpcionesProblema():
	MainLabel.visible = true
	$"../Botones".visible = true
#endregion

func Cuadernon():
	ocultarOpcionesProblema()
	emit_signal("baja")
	Npcs.visible = false
	
func welose():
	if Main.Felicidad <= 0:
		Main.NpcActual = 0
		ocultarConsecuencia()
		ocultarOpcionesProblema()
		emit_signal("perder")
		perdimos = true
		Main.LoseText = "Tu felicidad decayo demasiado y parece que ya nadie quiere trabajar para ti"
	if Main.Dinero <= 0:
		Main.NpcActual = 0
		ocultarConsecuencia()
		ocultarOpcionesProblema()
		emit_signal("perder")
		perdimos = true
		Main.LoseText = "Te quedaste sin dinero y sin dinero ninguna empresa funciona"
	if Main.Empleados <= 0:
		Main.NpcActual = 0
		ocultarConsecuencia()
		ocultarOpcionesProblema()
		emit_signal("perder")
		perdimos = true
		Main.LoseText = "Se fueron los ultimos empleados, si nadie quiere trabajar para ti, no hay empresa"

func wewin():
	if Main.Dinero >1000:
		emit_signal("ganar")
		ocultarOpcionesProblema()
		ganamos = true
		
func _on_libreta_reseteate():
	Reset()

func Reset():
	Main.Dinero = 100
	Main.Empleados = 10
	Main.Felicidad = 5
	dialogo_id = 1
	perdimos = false
	ganamos = false
	Main.NpcActual = 1
	revelarOpcionesProblema()
	ocultarConsecuencia()
	
func cambiarNpc():
	print(npcActual)
	Main.NpcActual = npcActual
	emit_signal("animacionGo")

func _on_cuaderno_subida_end():
	Hogar.visible = true
	revelarOpcionesProblema()
	Npcs.visible = true

func _on_hogar_ocultarhogar():
	Hogar.visible = false
	Main.NpcActual = npcActual
	emit_signal("animacionGo")
	
