extends Node2D

var v := 1
var zoom:= 10
var resX: int
var resY: int
var time:=0

var fade = 600

var fps_label: Label

var novaPos
var rng = RandomNumberGenerator.new()

func principal(x,y,t):
	y = y/zoom
	x = x/zoom
	t = t/zoom
	return Vector2((x-10)*(x+10),0)

func cambiarCoords(x,y):
	return Vector2(x-resX/2,-y+resY/2)

func retornarCoords(pos:Vector2):
	return Vector2(pos[0]+resX/2,-pos[1]+resY/2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resX = get_viewport().size.x
	resY = get_viewport().size.y
	fps_label = Label.new()
	fps_label.position = Vector2(10, 10)  # Posición en la pantalla
	add_child(fps_label)  # Añadir el label al nodo principal



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time = time+1
	if time%1==0:
		for i in range(1):
			novaPos = Vector2(rng.randf_range(-3*resX/4,3*resX/4),rng.randf_range(-3*resY/4,3*resY/4))
			add_child(punt.new(novaPos, fade))
	
	# Obtener los FPS actuales
	var fps = Engine.get_frames_per_second()
	# Actualizar el texto del label con el valor de FPS
	fps_label.text = "FPS: " + str(fps)
