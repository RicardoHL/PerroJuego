extends KinematicBody2D

var moveSpeed = 100
var maxSpeed = 150

const jumpHeight = -250
const up = Vector2(0,-1)
const gravity = 15

var atacando = false

onready var idle = $Idle
onready var walk = $Walk
onready var attack = $Attack
onready var time = $Timer
onready var collision = $CollisionShape2D
onready var animationPlayer = $AnimationPlayer

var motion = Vector2()
var count = 0

func _physics_process(delta):
	
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("raton_i"):
		if is_on_floor():
			idle.visible = false
			walk.visible = false
			attack.visible = true
			animationPlayer.play("Attack")
			atacando=true
			motion.x = 0
			
	if Input.is_action_pressed("ui_right") && atacando==false:

		idle.visible = false
		walk.visible = true
		attack.visible = false
		idle.flip_h = false
		walk.flip_h = false
		attack.flip_h = false
		collision.position.x = -5
		animationPlayer.play("Walk")
		motion.x = min(motion.x + moveSpeed, maxSpeed)
		if is_on_floor():
			if Input.is_action_pressed("ui_accept"):
				motion.y = jumpHeight
				
		
	elif Input.is_action_pressed("ui_left") && atacando==false:

		idle.visible = false
		walk.visible = true
		attack.visible = false
		idle.flip_h = true
		walk.flip_h = true
		attack.flip_h = true
		collision.position.x = 5
		animationPlayer.play("Walk")
		motion.x = max(motion.x - moveSpeed, -maxSpeed)
		if is_on_floor():
			if Input.is_action_pressed("ui_accept"):
				motion.y = jumpHeight
				
		
	elif Input.is_action_pressed("tecla_z"):
		moveSpeed = 50
		maxSpeed = 100
		
	elif Input.is_action_just_released("tecla_x"):
		moveSpeed = 100
		maxSpeed = 150
		
	elif Input.is_action_just_pressed("tecla_c"):
		moveSpeed = 150
		maxSpeed = 200
		
	else:
		if atacando == false:
			friction = true
			idle.visible = true
			walk.visible = false
			attack.visible = false
			animationPlayer.play("Idle")

	if is_on_floor():
		if friction == true:
			motion.x = lerp(motion.x,0,0.5)
			
	else:
		
		idle.visible = false
		walk.visible = true
		attack.visible = false
		animationPlayer.play("Walk")
			
		if friction == true:
			motion.x = lerp(motion.x,0,0.01)
			
	motion = move_and_slide(motion,up)
	

func _on_AnimationPlayer_animation_finished(Attack):
		atacando=false
