extends Control

@onready var papel = load("res://Assets/sprites/papel.png")
@onready var piedra = load("res://Assets/sprites/piedra.png")
@onready var tijera = load("res://Assets/sprites/tijera.png")

@onready var seleccion = load("res://Assets/sound/Misc/select.wav")
@onready var pierdes = load("res://Assets/sound/Misc/Pierdes.wav")
@onready var ganas = load("res://Assets/sound/Misc/Ganas.wav")

@onready var DibujaJugador = get_node("PanelArriba/PanelJugador/DibujarJugador")
@onready var DibujaIA = get_node("PanelArriba/PanelIA2/DibujarIA")

@onready var textoPuntuacion = get_node("Puntuacion")
@onready var efectos = get_node("Efectos")

var rng = RandomNumberGenerator.new()
var puntosJ = 0
var puntosIA = 0

var seleccionJ = 0
var seleccionIA = 0

func IAbasica():
	match int(round(rng.randf_range(0,2))):
		0:
			DibujaIA.set_texture(papel)
			seleccionIA = 0
		1:
			DibujaIA.set_texture(piedra)
			seleccionIA = 1
		2:
			DibujaIA.set_texture(tijera)
			seleccionIA = 2
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func ManejadorSonido(sonido):
	efectos.set_stream(sonido)
	efectos.play()
	
func ManejadorGeneral():
	ManejadorSonido(seleccion)
	IAbasica()
	LogicaJuego()
	ManejaPuntuaciones()

func ManejaPuntuaciones():
	textoPuntuacion.set_text("Puntuacion: " + str(puntosJ)+":"+str(puntosIA))

func LogicaJuego():
	if seleccionJ != seleccionIA:
		if seleccionJ == 0 && seleccionIA == 1:
			puntosJ += 1
			ManejadorSonido(ganas)
		elif seleccionJ == 1 && seleccionIA == 2:
			puntosJ += 1
			ManejadorSonido(ganas)
		elif seleccionJ == 2 && seleccionIA == 0:
			puntosJ += 1
			ManejadorSonido(ganas)
		else:
			puntosIA += 1
			ManejadorSonido(pierdes)
	else:
		pass

func _on_papel_boton_pressed():
	DibujaJugador.set_texture(papel)
	seleccionJ = 0
	ManejadorGeneral()
	
	


func _on_piedra_boton_pressed():
	DibujaJugador.set_texture(piedra)
	seleccionJ = 1
	ManejadorGeneral()


func _on_tijera_boton_pressed():
	DibujaJugador.set_texture(tijera)
	seleccionJ = 2
	ManejadorGeneral()
