extends RigidBody2D

@export var speed: int = 1000


func explode():
    $AnimationPlayer.play("Explosion")
    print('explosion')

