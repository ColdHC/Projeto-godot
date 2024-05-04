extends CharacterBody2D

var speed = 25
var player_chase = false
var mob_damage = 10

@onready var player_tofunc = %Player
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var timer = $Timer
var deceleration_factor = 0.5



func _physics_process(_delta):
	if player_chase == true:
		position += (player_tofunc.position - position)/speed
	
		if(player_tofunc.position.x - position.x) < 0:
				animated_sprite_2d.flip_h = true
		elif(player_tofunc.position.x - position.x) > 0:
				animated_sprite_2d.flip_h = false

func _on_area_2d_body_entered(_body):
	player_chase = true



func _on_area_2d_body_exited():
		player_chase = false

	

	
	 # Replace with function body.
