extends Node2D

onready var rockButton = get_node("hbcJKP/btnRock")
onready var paperButton = get_node("hbcJKP/btnPaper")
onready var scissorsButton = get_node("hbcJKP/btnScissors")
onready var monkeyPlayerSprite = get_node("sprMonkeyPlayer")
onready var monsterPlayerSprite = get_node("sprMonsterPlayer")

func _ready():
	var map = [rockButton.get_name(), paperButton.get_name(), scissorsButton.get_name()]
	print(map)

func _on_btnRock_pressed():
	monsterElection()
	monkeyPlayerSprite.set_frame(0)

func _on_btnPaper_pressed():
	monsterElection()
	monkeyPlayerSprite.set_frame(1)

func _on_btnScissors_pressed():
	monsterElection()
	monkeyPlayerSprite.set_frame(2)

func monsterElection():
	randomize()
	var election = randi()%3+0
	monsterPlayerSprite.set_frame(election)
	print(election)