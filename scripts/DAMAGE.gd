extends Area2D
@onready var player_tofunc = %Player
var player_in = false
@onready var monster = get_parent()

func _on_body_entered(body):
	player_in = true
	player_tofunc.decrease_player_life(monster.mob_damage)

	var knockback_force = Vector2(50, 0)  # Ajuste este valor conforme necessário
	
	if(player_tofunc.position.x - position.x) < 0:
		player_tofunc.move_and_collide(-knockback_force)
	elif(player_tofunc.position.x - position.x) > 0:			
		player_tofunc.move_and_collide(+knockback_force)
		
	player_tofunc.animated_sprite_2d.play("hit")


func _on_body_exited(body):
	player_in = false
