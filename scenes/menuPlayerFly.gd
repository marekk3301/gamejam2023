extends AnimatedSprite

var velocity = Vector2(0.5, 0.5)

func _process(delta):
	self.position += velocity * delta
	self.rotation -= 0.2 * delta

	# Sprawdzanie, czy postać wychodzi poza ekran i zmiana kierunku
	if self.position.x < 0 or self.position.x > get_viewport().size.x:
		velocity.x = -velocity.x
	if self.position.y < 0 or self.position.y > get_viewport().size.y:
		velocity.y = -velocity.y



