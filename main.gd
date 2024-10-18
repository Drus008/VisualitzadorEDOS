extends Node2D



var resX:=1920
var resY:=1080
var time:=0

var fps_label: Label

var novaPos
var rng = RandomNumberGenerator.new()

func principal(x,y,t):
	return Vector2((y**2-1)/100,t)

func cambiarCoords(x,y):
	return Vector2(x-resX/2,-y+resY/2)

func retornarCoords(pos:Vector2):
	return Vector2(pos[0]+resX/2,-pos[1]+resY/2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fps_label = Label.new()
	fps_label.position = Vector2(10, 10)  # Posición en la pantalla
	add_child(fps_label)  # Añadir el label al nodo principal
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time = time+1
	if time%2==0:
		for i in range(3):
			novaPos = Vector2(rng.randf_range(-resX,resX),rng.randf_range(-resY,resY))
			add_child(punt.new(novaPos))
	
	# Obtener los FPS actuales
	var fps = Engine.get_frames_per_second()
	# Actualizar el texto del label con el valor de FPS
	fps_label.text = "FPS: " + str(fps)
