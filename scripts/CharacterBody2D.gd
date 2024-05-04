extends CharacterBody2D
@onready var character_body_2d = $"."
@onready var animated_sprite_2d = $AnimatedSprite2D


const SPEED = 130 
const SPEED_RUNNING = 200
var player_life = 100
# Get the gravity from the project settings to be synced with RigidBody nodes.
@onready var label = $Label

func decrease_player_life(value):
	player_life = player_life - value
	
	print(player_life)
	
	

func _physics_process(delta):
	# Add the gravity.
	# Handle jump.
	label.text = str(player_life)
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("up","down")
	
	var running = Input.is_action_pressed("run")
	
	
	if direction > 0:
		animated_sprite_2d.play("run")
		animated_sprite_2d.flip_h = false
		
	if direction < 0:
		animated_sprite_2d.play("run")
		animated_sprite_2d.flip_h = true
		
	if direction == 0:
		animated_sprite_2d.play("idle")
	
	if direction_y < 0:
		animated_sprite_2d.play("run_up")
	if direction_y > 0:
		animated_sprite_2d.play("run_down")
		
	
			
	if direction:
		if running:
			velocity.x = direction * SPEED_RUNNING
		else:
			velocity.x = direction * SPEED
	else:
		if running:
			velocity.x = move_toward(velocity.x, 0, SPEED_RUNNING)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction_y:
		if running:
			velocity.y = direction_y * SPEED_RUNNING
		else:
			velocity.y = direction_y * SPEED
	else:
		if running:
			velocity.y = move_toward(velocity.y,0,SPEED_RUNNING)
		else:
			velocity.y = move_toward(velocity.y,0,SPEED)
		

	move_and_slide()
