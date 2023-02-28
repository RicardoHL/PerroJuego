extends Node2D

onready var c1En = $Corazon1/CorazonEntero
onready var c1Mi = $Corazon1/CorazonMitad
onready var c1Va = $Corazon1/CorazonVacio
onready var c2En = $Corazon2/CorazonEntero
onready var c2Mi = $Corazon2/CorazonMitad
onready var c2Va = $Corazon2/CorazonVacio
onready var c3En = $Corazon3/CorazonEntero
onready var c3Mi = $Corazon3/CorazonMitad
onready var c3Va = $Corazon3/CorazonVacio

var salud = 6

func hitPlayer():
	if(salud != 0):
		salud -= 1
	cambiarVida()

func heal():
	if(salud != 6):
		salud += 1
	cambiarVida()

func cambiarVida():
	if(salud == 0):
		c1En.visible = false
		c1Mi.visible = false
		c1Va.visible = true
		c2En.visible = false
		c2Mi.visible = false
		c2Va.visible = true
		c3En.visible = false
		c3Mi.visible = false
		c3Va.visible = true
	elif(salud == 1):
		c1En.visible = false
		c1Mi.visible = true
		c1Va.visible = false
		c2En.visible = false
		c2Mi.visible = false
		c2Va.visible = true
		c3En.visible = false
		c3Mi.visible = false
		c3Va.visible = true
	elif(salud == 2):
		c1En.visible = true
		c1Mi.visible = false
		c1Va.visible = false
		c2En.visible = false
		c2Mi.visible = false
		c2Va.visible = true
		c3En.visible = false
		c3Mi.visible = false
		c3Va.visible = true
	elif(salud == 3):
		c1En.visible = true
		c1Mi.visible = false
		c1Va.visible = false
		c2En.visible = false
		c2Mi.visible = true
		c2Va.visible = false
		c3En.visible = false
		c3Mi.visible = false
		c3Va.visible = true
	elif(salud == 4):
		c1En.visible = true
		c1Mi.visible = false
		c1Va.visible = false
		c2En.visible = true
		c2Mi.visible = false
		c2Va.visible = false
		c3En.visible = false
		c3Mi.visible = false
		c3Va.visible = true
	elif(salud == 5):
		c1En.visible = true
		c1Mi.visible = false
		c1Va.visible = false
		c2En.visible = true
		c2Mi.visible = false
		c2Va.visible = false
		c3En.visible = false
		c3Mi.visible = true
		c3Va.visible = false
	elif(salud == 6):
		c1En.visible = true
		c1Mi.visible = false
		c1Va.visible = false
		c2En.visible = true
		c2Mi.visible = false
		c2Va.visible = false
		c3En.visible = true
		c3Mi.visible = false
		c3Va.visible = false
