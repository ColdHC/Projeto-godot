extends CharacterBody2D

var speed = 25
var player_chase = false
var player_in = false
var mob_damage = 10
signal morreu
signal health_changed(old_value, new_value)

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

	
func _on_damage_body_entered(body):
	player_in = true
	player_tofunc.decrease_player_life(10)

	var knockback_force = Vector2(50, 0)  # Ajuste este valor conforme necessário
	
	if(player_tofunc.position.x - position.x) < 0:
		player_tofunc.move_and_collide(-knockback_force * deceleration_factor)
	elif(player_tofunc.position.x - position.x) > 0:			
		player_tofunc.move_and_collide(+knockback_force * deceleration_factor)
		
	player_tofunc.animated_sprite_2d.play("hit")
	

func _on_damage_body_exited():
	player_in = false
	
	 # Replace with function body.
