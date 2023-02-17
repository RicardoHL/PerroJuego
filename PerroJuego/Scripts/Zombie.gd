extends KinematicBody2D

var moveSpeed = 100
var maxSpeed = 150

var timer

const jumpHeight = -250
const up = Vector2(0,-1)
const gravity = 15

onready var idle = $Idle
onready var collision = $CollisionShape2D
onready var animationZombie = $AnimationZombie
onready var hitboxAtaque = $Area_Ataque/HitBoxAtaque
onready var hitboxChoque = $Area_Choque/HitBoxChoque
onready var rangoVision = $Area_Vision/RangoVision
onready var spriteCono = $Sprite


var move : Vector2 = Vector2(0,0)

var ready : bool = false
var motion = Vector2()
var count = 0
var dir = -1

var seguirJugador = false


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
	
	if(seguirJugador == false):
		var numero =randi() % (1001)
 
		
		
		if numero > 0  && numero < 333 :
			mov = true		
			dir = 1
			animationZombie.play("WalkE")
		elif numero > 334  && numero < 666:
			dir = -1
			mov = true
			animationZombie.play("WalkE")
		elif numero > 667  && numero < 1000:
			mov = false
			
			animationZombie.play("IdleE")
	
	
	


func _init():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 2.0
	timer.autostart = true
	timer.connect("timeout", self, "finTiempo")
	
	
func finTiempo():
	print("fin")
	
	set_dir()
	

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
				rangoVision.scale.x = -2.116
			else:
				idle.flip_h = false
				hitboxAtaque.position.x = 21
				rangoVision.position.x = 52.256
				rangoVision.scale.x = 2.116
					
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
		
		
func _on_AreaVision_body_entered(body):
	if (body.name == "Player"):
		seguirJugador = true
		print("Siguiendo jugador...")
		if(mov == false):
			if(rangoVision.scale.x > 0):
				dir = 1
			else:
				dir = -1
			mov = true
			$AnimationZombie.play("WalkE")
			
		
		
func _on_AreaVision_body_exited(body):
	if(body.name == "Player"):
		seguirJugador = false
		print("Jugador perdido")
		if(rangoVision.scale.x > 0):
			rangoVision.scale.x = -2.116
			rangoVision.position.x = -52.256
		else:
			rangoVision.scale.x = 2.116
			rangoVision.position.x = 52.256
	pass # Replace with function body.
		

func _on_AnimationZombie_animation_finished(nombre):
	if(nombre=="Attack" and no_detectado==false):
		animationZombie.play("Attack")
	elif(nombre=="Attack"):
		animationZombie.play("WalkE")
		mov = true
	pass # Replace with function body.

func _on_Area_Choque_body_entered(body):
	
	
	pass # Replace with function body.
