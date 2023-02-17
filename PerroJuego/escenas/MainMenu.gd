extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var main_menu_button = preload("res://escenas/MainButton.tscn")
	var button = ["Nueva partida", "opciones", "salir", "Prueba"]
	
	for i in range(button.size()):
		var instance = main_menu_button.instance()
		instance.text = button[i]
		match i:
			0:
				instance.connect("pressed", self, "load_scene",["res://World.tscn"])
			1:
				instance.connect("pressed", self, "load_scene",["res://escenas/Opciones.tscn"])
			2:
				instance.connect("pressed", self, "quit")
			
				
		$CenterContainer/PanelContainer/VBoxContainer/Botones.add_child(instance)
	

func load_scene(scene: String) -> void:
	var error_code = get_tree().change_scene(scene)
	if error_code != 0:
		print("error " , error_code)
		
func quit() -> void:
	get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
