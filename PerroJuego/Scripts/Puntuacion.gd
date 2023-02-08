extends Camera2D

var muslos = 0

func _ready():
	
	$MeatCollectedText.text = String(muslos)

func handleMeatCollected():
	print("Meat Collected")
	muslos += 1
	$MeatCollectedText.text = String(muslos)

