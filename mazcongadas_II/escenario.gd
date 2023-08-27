extends Node2D


# Declare member variables here. Examples:
# var a = 2
var banAt = false
var playerAttack = 0
var enemyDefense = 0

var li_fondo0 = preload("res://imagen/fondo0.jpg")
var li_fondo1 = preload("res://imagen/fondo1.jpg")
var li_fondo2 = preload("res://imagen/fondo2.jpg")


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("jugador/hud/Timerempezar").start()
	get_node("jugador/carta").hide()
	get_node("malo").hide()
	playerAttack = get_player_attack()
	enemyDefense = get_enemy_defense()
	get_node("jugador/hud/ft").hide()
	get_node("jugador/carta/ataque").hide()
#	fondo
	print("fondo: " ,get_node("fondo0").texture)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timerempezar_timeout():
	banAt = true
	get_node("jugador/hud/Label").hide()
	get_node("jugador/carta").show()
	get_node("malo").show()
#	get_node("jugador/carta/Texto/Ataque").set_text(str("Tu ataque: \n") + str(playerAttackstr)+("\n")+str("Ataca"))
	get_node("jugador/carta/Texto/Ataque").set_text(str("Tu carta: \n")+ str(playerAttack)+("\n")+str("Ataca"))
	get_node("malo/Label").set_text(str("El malo: \n") + str(enemyDefense))
	print("Empieza")
	get_node("fondo0").set_texture(li_fondo1)
	pass # Replace with function body.


func _on_TextureButton_pressed():
	if banAt:
		banAt = false
		print("ataque",playerAttack)
		var ale = int(rand_range(1,6))
		var alemalo = int(rand_range(1,6))
		get_node("jugador/carta/Texto/Ataque").set_text(str("Tu ataque total: \n")+ str(playerAttack)+(" + ")+str(ale)+(" = ")+str(ale+playerAttack)+str("\nBien"))
		get_node("malo/Label").set_text(str("Malo defiende: \n")+ str(enemyDefense)+(" + ")+str(alemalo)+(" = ")+str(enemyDefense+alemalo)+str("\n Acho"))
		get_node("jugador/TextureButton/Timer").start()
		get_node("jugador/hud/Label").show()
		get_node("jugador/carta/ataque").show()
#		poner cartas
		if ale == 1:
			print("poner carta 1")
		elif ale == 2:
			print("poner carta 2")
		else:
			print("poner carta del 3 al 5")
#		poner resultados
		if ale+playerAttack > enemyDefense+alemalo:
			get_node("jugador/hud/Label").set_text(str(" You win! \n ¡El jugador gana! "))
			get_node("jugador/hud/ft").show()
		elif ale+playerAttack < enemyDefense+alemalo:
			get_node("jugador/hud/Label").set_text(str("You lost, the bad guy won¡\nEl enemigo gana! ¡Pierdes!"))
			get_node("jugador/hud/ft").show()
		else:
			get_node("jugador/hud/Label").set_text(str("¡Empate! \n "))
			get_node("jugador/hud/ft").show()
#
#func  -> int:
## Aquí puedes obtener el valor de ataque del jugador de forma alaeatoria
	
func get_player_attack()-> int:
	return  int(rand_range(1,6))
	
func get_enemy_defense()-> int:
	return  int(rand_range(1,6))

func _on_Timer_timeout():
	print("reinicio")
	print(get_tree().reload_current_scene())
#	restart_scene()
	pass # Replace with function body.

#func restart_scene():
#	var current_scene = get_tree().get_current_scene()
#	var scene_path = current_scene.get_path()
#	var scene_instance = re_load(scene_path)
#	print(get_tree().change_scene(scene_instance))
