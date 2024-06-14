extends Sprite2D
var tempo = 0
@onready var yomero = $"."

func _ready():
	$"../TimerP2".start()

func _on_timer_parpadeo_timeout():
	yomero.self_modulate = Color (1, 1, 1, 0.5)
	$"../TimerP2".start()
	
func _on_timer_p_2_timeout():
	yomero.self_modulate = Color (1, 1, 1, 1)
	$"../TimerParpadeo".start()

