extends Camera2D

@export var decay = 0.85 
@export var max_offset = Vector2(10, 10)
@export var max_roll = 0.2
@export var noise : FastNoiseLite

var trauma = 0.0
var trauma_power = 2
var noise_pos = Vector3.ZERO

func add_trauma(amount):
	trauma = min(trauma + amount, 0.5)
	
func _process(delta):
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()
		
func shake():
	var amount = pow(trauma, trauma_power)
	rotation = max_roll * amount * randf_range(-1, 1) #* noise.get_noise_3dv(noise_pos)
	offset.x = max_offset.x * amount * randf_range(-1, 1) # * noise.get_noise_3dv(noise_pos)
	offset.y = max_offset.y * amount * randf_range(-1, 1) # * noise.get_noise_3dv(noise_pos)
	noise_pos += Vector3.ONE
