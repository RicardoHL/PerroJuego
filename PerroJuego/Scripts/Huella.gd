extends Node2D

onready var huellaVerde = $HuellaVerde
onready var huellaRoja = $HuellaRoja
onready var huellaAzul = $HuellaAzul

func velocidadLenta():
	
	huellaAzul.visible = true
	huellaVerde.visible = false
	huellaRoja.visible = false
	
func velocidadNormal():
	
	huellaAzul.visible = false
	huellaVerde.visible = true
	huellaRoja.visible = false
	
func velocidadRapida():
	
	huellaAzul.visible = false
	huellaVerde.visible = false
	huellaRoja.visible = true
