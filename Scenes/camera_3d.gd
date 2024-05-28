extends Camera3D

@export var scroll_speed: float = 1.0
@export var ray: RayCast3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var hit_point: Vector3
	if ray.is_colliding():
		hit_point = ray.get_collision_point()
	else: print('broken')
	if Input.is_action_just_pressed("scroll_up"):
		var tween = get_tree().create_tween()
		tween.tween_property(self, "global_position", self.global_position + hit_point, .1)
