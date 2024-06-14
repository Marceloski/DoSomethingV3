extends Node2D
@onready var H = $H
@onready var M = $M

func _ready():
	if Main.genero == 2:
		M.visible = true
	else:
		H.visible = true
