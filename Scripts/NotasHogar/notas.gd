extends Node2D
@onready var Texto = $Sprite2D/Label
@onready var anim = $AnimationPlayer
@onready var me = $Sprite2D
@onready var ButtonLabel = $Sprite2D/TextureButton/Label
@onready var ButtonSprite = $Sprite2D/TextureButton/Sprite2D
signal aparece

func _ready():
	me.visible = false
	
func _on_texture_button_mouse_entered():
	ButtonLabel.self_modulate = Color(1, 1, 1, 0.5)
	ButtonSprite.self_modulate = Color(1, 1, 1, 0.5)

func _on_texture_button_mouse_exited():
	ButtonLabel.self_modulate = Color(1, 1, 1, 1)
	ButtonSprite.self_modulate = Color(1, 1, 1, 1)
	
var dialogo = [
	{
		"id": 1,
		"text": "Esta es tu casa, acogedora como cualquiera que puedas costear"
	},
		{
		"id": 2,
		"text": "Esta es tu cocina, donde se preparan las comidas más deliciosas."
	},
		{
		"id": 3,
		"text": "Esta es tu sala, donde cada rincón guarda un recuerdo familiar"
	},
		{
		"id": 4,
		"text": "Este es tu cuarto, tan acogedor como los abrazos de mamá"
	}
	]

func Dialogo(id):
	for dialogue in dialogo:
		if dialogue["id"] == id:
			return dialogue["text"]
	return "Texto no encontrado" 

func SacarDialogo():
	var index = randi_range(1, 4)
	Texto.text = Dialogo(index)

func _on_hogar_go():
	SacarDialogo()
	me.visible = true
	anim.play("baja")

func _on_texture_button_pressed():
	anim.play("sube")
	emit_signal("aparece")
