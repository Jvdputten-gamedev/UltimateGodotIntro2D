extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

@export var max_speed: int = 500
var speed: int = max_speed

signal laser_fired(pos, direction)
signal grenade_thrown(pos, direction)



func _process(_delta):

	# Movement	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()


	# Rotate
	look_at(get_global_mouse_position())

	# laser shooting input
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$GPUParticles2D.emitting = true
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]

		can_laser = false
		$LaserTimer.start()

		laser_fired.emit(selected_laser.global_position, player_direction)
	

	if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		can_grenade = false
		$GrenadeTimer.start()
		var grenade_position = $LaserStartPositions.get_children()[0].global_position
		grenade_thrown.emit(grenade_position, player_direction)


func _on_laser_timer_timeout():
	can_laser = true # Replace with function body.


func _on_grenade_timer_timeout():
	can_grenade = true


