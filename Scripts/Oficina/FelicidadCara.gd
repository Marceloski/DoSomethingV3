extends Node2D
@onready var uno = $Felicidad1
@onready var dos = $Felicidad2
@onready var tres = $Felicidad3

func _process(delta):
	Anddd()
	
func Anddd():
	if Main.Felicidad > 7:
		OcultarTodo()
		uno.visible = true
	if  Main.Felicidad < 5 and Main.Felicidad > 4:
		OcultarTodo()
		dos.visible = true
	if Main.Felicidad < 3 or 0:
		OcultarTodo()
		tres.visible = true
		
func OcultarTodo():
	uno.visible = false
	dos.visible = false
	tres.visible = false

