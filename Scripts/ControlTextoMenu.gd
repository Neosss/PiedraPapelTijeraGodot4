extends Label

var efectoSonido = preload("res://Assets/sound/Misc/typeWriteSound.mp3")
@onready var tween = get_tree().create_tween()
@onready var nodoMusica = AudioStreamPlayer.new()



# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_child(nodoMusica)
	nodoMusica.set_stream(efectoSonido)
	tween.tween_property(self,"visible_characters", len(self.get_text()), 1.0)
	nodoMusica.play(3.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
