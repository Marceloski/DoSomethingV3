extends Control
signal ajustes
@onready var anim = $AnimationPlayer
@onready var CajaAjustes = $Opciones
@onready var Audio = $AudioStreamPlayer2D
@onready var SliderAudio = $Audio


var project_settings = ProjectSettings.get_setting("Window")
var original_width = 1152
var original_height = 648
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_configuracion_pressed():
	CajaAjustes.show()
	anim.play("Bajada")
	
	pass # Replace with function body.

func _on_atras_pressed():
	anim.play("Subida")
	pass # Replace with function body.



func _on_configuracion_tutorial_pressed():
	CajaAjustes.show()
	anim.play("Bajada")
	pass # Replace with function body.




func _on_check_button_toggled(button_pressed):
	if button_pressed:
		get_viewport().size = DisplayServer.screen_get_size()
	else:
		
		get_viewport().size = Vector2(original_width, original_height)
	pass


func _on_configuracion_oficina_pressed():
	CajaAjustes.show()
	anim.play("Bajada")
	pass # Replace with function body.
