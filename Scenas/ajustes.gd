extends Control
signal ajustes
@onready var anim = $AnimationPlayer
@onready var CajaAjustes = $Opciones


# Called when the node enters the scene tree for the first time.
func _ready():
	CajaAjustes.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_configuracion_pressed():
	CajaAjustes.show()
	anim.play("Bajada")
	
	pass # Replace with function body.

func _on_atras_pressed():
	anim.play("Subida")
	pass # Replace with function body.

func _on_check_button_toggled(button_pressed):
	
	pass # Replace with function body.
