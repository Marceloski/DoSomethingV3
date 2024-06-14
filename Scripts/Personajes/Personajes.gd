extends Node2D
@onready var Joan = $Npcs/Joan
@onready var Chloe = $Npcs/Chloe
@onready var Manbru = $Npcs/Manbru
@onready var Nani = $Npcs/Nani
@onready var Sana = $Npcs/Sana
@onready var holder = $Chloe2
@onready var anim = $AnimationPlayer
var libretavisible = false

func _ready():
	holder.visible = false
	anim.play("Llega")
	
func _process(delta):
	Revelador()
	
func OcultarTodo():
	Joan.visible = false
	Chloe.visible = false
	Manbru.visible = false
	Nani.visible = false
	Sana.visible = false

func Revelador():
	if !libretavisible:
		if Main.NpcActual == 1:
			OcultarTodo()
			Sana.visible = true
		if Main.NpcActual == 2:
			OcultarTodo()
			Chloe.visible = true
		if Main.NpcActual == 3:
			OcultarTodo()
			Joan.visible = true
		if Main.NpcActual == 4:
			OcultarTodo()
			Nani.visible = true
		if Main.NpcActual == 5:
			OcultarTodo()
			Manbru.visible = true
		if Main.NpcActual == 0:
			OcultarTodo()
	else:
		OcultarTodo()

func _on_texto_nubes_animacion_go():
	anim.play("Llega")

func _on_texto_nubes_byebye():
	anim.play("SeVa")

func _on_libreta_animaciongo():
	anim.play("Llega")

func _on_cuaderno_ocultar():
	libretavisible = true

func _on_cuaderno_revelar():
	libretavisible = false
