extends StaticBody2D

signal player_entered_gate

func _on_area_2d_body_entered(body):
	player_entered_gate.emit(body)
	
func some_other_funcin():
	print('something')
