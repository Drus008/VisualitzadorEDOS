extends Sprite2D

class_name punt

var particulas: CPUParticles2D

const v := 1

var vel: Vector2
var pos: Vector2
var t0: int
var tvida:=0
var fade: int

func _init(posInicial:Vector2, fadeI: int = 500) -> void:
	pos = posInicial
	fade = fadeI
	position = Main.retornarCoords(pos)
	t0 = Main.time
	
	particulas = CPUParticles2D.new()
	particulas.gravity = Vector2(0,0)
	particulas.amount = 100
	add_child(particulas)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = load("res://Sprites/punt.png")
	scale = Vector2(0.25,0.25)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if tvida>fade:
		queue_free()
	eliminarSiLluny()
	vel = Main.principal(pos[0],pos[1], 50)
	pos = pos + vel*delta*v
	tvida = tvida +1
	modulate.a = 1-float(tvida)/fade
	position = Main.retornarCoords(pos)

func eliminarSiLluny():
	if pos.length()>1920:
		queue_free()
