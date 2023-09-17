extends CharacterBody2D

#Top down has not gravity

@export var normalSpeed : float = 50.0
@onready var animations = $AnimationPlayer
var direction = Vector2.DOWN

func handle_input():
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * normalSpeed

func update_animation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else :
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
		elif velocity.y >0: direction = "Down"
		
		animations.play("walk" + direction)
	
func _physics_process(delta):
	handle_input()
	update_animation()
	move_and_slide()
