extends "res://pawns/actor.gd"

func get_input_direction():
	var horizontal = randi()%3-1
	var vertical = randi()%3-1
	
	var result = Vector2(
		int(horizontal),
		int(vertical)
	)
	if previous_direction.x == 0 and previous_direction.y != 0:
		result.x = 0
	elif previous_direction.x != 0 and previous_direction.y == 0:
		result.y = 0
	elif result.x != 0 and result.y != 0:
		result.y == 0
	
	previous_direction.x = abs(result.x)
	previous_direction.y = abs(result.y)
	#print("yo")
	
	return result

func move_to(target_position):
	#set_process(false)
	#Grid.deactivate()
	#$AnimationPlayer.play("walk")

	# Move the node to the target cell instantly,
	# and animate the sprite moving from the start to the target cell
	var move_direction = (target_position - position).normalized()
	$Tween.interpolate_property($Sprite, "position", - move_direction * 32, Vector2(), 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Sprite.position += -move_direction * 32
	position = target_position
	$Tween.start()
	
	# Stop the function execution until the animation finished
	yield($Tween, "tween_all_completed")
	#set_process(true)
	#Grid.activate()