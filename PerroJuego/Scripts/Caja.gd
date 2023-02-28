extends Area2D

onready var animationBox = $AnimationBox

var abierta = false

func _on_Caja2D_area_entered(area):
	
	if area.name == "AreaAttack" and abierta == false:
		abierta = true
		animationBox.play("AbrirCaja")
