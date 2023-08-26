extends HBoxContainer

var digit_coords = {
	1: Vector2(0, 0),
	2: Vector2(8, 0),
	3: Vector2(16, 0),
	4: Vector2(24, 0),
	5: Vector2(32, 0),
	6: Vector2(0, 8),
	7: Vector2(8, 8),
	8: Vector2(16, 8),
	9: Vector2(24, 8),
	0: Vector2(32, 8)
}

func _ready():
	display_digits(123)

func display_digits(n):
	var s = "%08d" % n
	for i in 8:
		get_child(i).texture.region = Rect2(digit_coords[int(s[i])], Vector2(8, 8))
