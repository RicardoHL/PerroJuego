extends KinematicBody2D

var moveSpeed = 100
var maxSpeed = 150

const jumpHeight = -250
const up = Vector2(0,-1)
const gravity = 15

onready var idle = $Idle
onready var collision = $CollisionShape2D
onready var animationZombie = $AnimationZombie

var no_detectado=true

var motion = Vector2()

func _physics_process(delta):
	
	motion.y += gravity
	var friction = true
	
	#animationZombie.play("WalkE")
	

func _on_Area_Vision_body_entered(body):
	
	if(body.name == "Player"):
		no_detectado = false
		print("Atacando")
		animationZombie.play("Attack")
		
		

func _on_Area_Vision_body_exited(body):
	if(body.name == "Player"):
		no_detectado = true
		print("Deja de atacar")


func _on_AnimationZombie_animation_finished(nombre):
	if(nombre=="Attack" and no_detectado==false):
		animationZombie.play("Attack")
		pass
