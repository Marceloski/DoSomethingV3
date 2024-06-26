extends HSlider
@export
var bus_name: String
var bus_index: int
@onready
var Audio = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	bus_index = AudioServer.get_bus_index("Master")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_value_changed(value):
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)
	pass # Replace with function body.
