extends CharacterBody2D

var speed = 25
var player_chase = false
var player = null
var player_in = false
@onready var player_tofunc = %CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var timer = $Timer
var deceleration_factor = 0.5


func _physics_process(delta):
	if player_chase == true:
		position += (player.position - position)/speed
	
		if(player.position.x - position.x) < 0:
				animated_sprite_2d.flip_h = true
		elif(player.position.x - position.x) > 0:
				animated_sprite_2d.flip_h = false
		
		
	
		


func _on_area_2d_body_entered(body):
	player = body
	player_chase = true



func _on_area_2d_body_exited(body):
		player_chase = false

	
func _on_damage_body_entered(body):
		player_in = true
		player_tofunc.decrease_player_life(10)

		var knockback_force = Vector2(50, 0)  # Ajuste este valor conforme necessário
		
		if(player.position.x - position.x) < 0:
			player.animated_sprite_2d.play("hit")
			player.move_and_collide(-knockback_force * deceleration_factor)
		elif(player.position.x - position.x) > 0:
			player.animated_sprite_2d.play("hit")
			player.move_and_collide(+knockback_force * deceleration_factor)
				
	

func _on_damage_body_exited(body):
	player_in = false
	
	 # Replace with function body.
