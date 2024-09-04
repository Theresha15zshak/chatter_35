extends Control
var a:Array = [1,2,3,4]
var b
func str_to_list(str_l) -> Array:
	var list_ = []
	for i in str_l:
		if i in "1234567890":
			list_.append(i)
	return list_

func _ready():
	b=str(a)
	print(b)
	print("==========")
	print(str_to_list(b))

