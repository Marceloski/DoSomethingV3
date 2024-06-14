extends Node2D
@onready var SpriteMujer = $MujerOficina
@onready var SpriteHombre = $HombreOficina

func _ready():
	if Main.genero == 2:
		SpriteMujer.visible = true
	else:
		SpriteHombre.visible = true



func _on_configuracion_pressed():
	emit_signal("ajustes")
	pass # Replace with function body.
