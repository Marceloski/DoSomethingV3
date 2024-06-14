extends Node2D
signal reseteate
signal animaciongo
@onready var razonperder = $Cuaderno/Derrota/Razon
@onready var ganar = $Cuaderno/Victoria
@onready var perder = $Cuaderno/Derrota
@onready var sprite = $Siguiente/Siguiente
@onready var label = $Siguiente/Siguiente/Label
@onready var anim = $AnimationPlayer

func _process(delta):
	razonperder.text = Main.LoseText
	
func _on_reiniciar_pressed():
	anim.play("Subida")
	emit_signal("animaciongo")

func _on_texto_nubes_perder():
	anim.play("Bajada")
	Ocultar()
	perder.visible = true
	
func Ocultar():
	ganar.visible = false
	perder.visible = false
	
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Subida":
		emit_signal("reseteate")

func _on_texto_nubes_ganar():
	anim.play("Bajada")
	Ocultar()
	ganar.visible = true
