extends Node2D

onready var animationMuslo = $AnimationMuslo

func _ready():
	animationMuslo.play("Flotar")

func _on_Muslo2D_body_entered(body):
	if body.name == "Player":
		body.add_Score()
		queue_free()
