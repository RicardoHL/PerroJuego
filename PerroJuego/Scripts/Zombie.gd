extends KinematicBody2D

var moveSpeed = 100
var maxSpeed = 150

const jumpHeight = -250
const up = Vector2(0,-1)
const gravity = 15

onready var idle = $Idle
onready var collision = $CollisionShape2D
onready var animationZombie = $AnimationZombie
onready var hitboxAtaque = $Area_Ataque/HitBoxAtaque
onready var rangoVision = $RangoVision

var move : Vector2 = Vector2(0,0)

var ready : bool = false
var motion = Vector2()
var count = 0
var dir = -1

var no_detectado=true

export (float) var Speed = 60
export (bool) var mov = true
export (float) var Gravity = 250.0

func _ready():
	ready = true;
	set_ani()
	set_dir()
	pass


func set_ani() -> void:
	$AnimationZombie.play("WalkE")
	pass


func set_dir() ->void:
	randomize()
	var rand = rand_range(1, 3)
	if rand == 1:
		dir = 1
	elif rand == 2:
		dir = -1
	elif rand == 3:
		mov = false

func _physics_process(delta):
	
	motion.y += gravity
	var friction = true
	#animationZombie.play("WalkE")
	
	if ready:
		apply_gravity(delta)
		if mov:
			move.x = Speed * dir
			move_and_slide(Vector2(move.x, 0), Vector2(0, -1))
			if move.x < 0:
				idle.flip_h = true
				hitboxAtaque.position.x = -21
				rangoVision.position.x = -52.256
			else:
				idle.flip_h = false
				hitboxAtaque.position.x = 21
				rangoVision.position.x = 52.256
					
			if is_on_wall():
				if dir > 0:
					dir = -1
					
				
					
					idle.flip_h = true
					hitboxAtaque.position.x = -21
					rangoVision.position.x = -52.256
					
				else:
					dir = 1
					idle.flip_h = false
					hitboxAtaque.position.x = 21
					rangoVision.position.x = 52.256
			pass
		pass
	pass
	
	
func apply_gravity(delta) -> void:
	var G = Gravity * delta
	move.y +=G
	move_and_slide(Vector2(0, move.y), Vector2(0, -1))
	if is_on_floor():
		move.y = 0
	pass
	

func _on_Area_Vision_body_entered(body):
	
	if(body.name == "Player"):
		no_detectado = false
		print("Atacando")
		mov = false
		animationZombie.play("Attack")
		
		

func _on_Area_Vision_body_exited(body):
	if(body.name == "Player"):
		no_detectado = true
		print("Deja de atacar")


func _on_AnimationZombie_animation_finished(nombre):
	if(nombre=="Attack" and no_detectado==false):
		animationZombie.play("Attack")
	elif(nombre=="Attack"):
		animationZombie.play("WalkE")
		mov = true
