extends Node2D

onready var rockButton = get_node("hbcJKP/btnRock")
onready var paperButton = get_node("hbcJKP/btnPaper")
onready var scissorsButton = get_node("hbcJKP/btnScissors")
onready var monkeyPlayerSprite = get_node("sprMonkeyPlayer")
onready var monsterPlayerSprite = get_node("sprMonsterPlayer")

onready var monkeySelection
onready var monsterSelection

onready var resultDialog = get_node("resultDialog")

func _ready():
	var map = [rockButton.get_name(), paperButton.get_name(), scissorsButton.get_name()]
	print(map)

func _on_btnRock_pressed():
	monsterElection()
	monkeyPlayerSprite.set_frame(0)
	monkeySelection = "rock"
	resultDialog.set_text(winner())
	resultDialog.popup()

func _on_btnPaper_pressed():
	monsterElection()
	monkeyPlayerSprite.set_frame(1)
	monkeySelection = "paper"
	resultDialog.set_text(winner())
	resultDialog.popup()

func _on_btnScissors_pressed():
	monsterElection()
	monkeyPlayerSprite.set_frame(2)
	monkeySelection = "scissors"
	resultDialog.set_text(winner())
	resultDialog.popup()

func monsterElection():
	randomize()
	var election = randi()%3+0
	monsterPlayerSprite.set_frame(election)
	if (election == 0):
		monsterSelection = "rock"
	elif (election == 1):
		monsterSelection = "paper"
	elif (election == 2):
		monsterSelection = "scissors"
	print(election)

func winner():
	if (monkeySelection == "rock" && monsterSelection == "rock"):
		return "draw"
	elif (monkeySelection == "rock" && monsterSelection == "paper"):
		return "Monster win"
	elif (monkeySelection == "rock" && monsterSelection == "scissors"):
		return "You win"
	if (monkeySelection == "paper" && monsterSelection == "rock"):
		return "You win"
	elif (monkeySelection == "paper" && monsterSelection == "paper"):
		return "draw"
	elif (monkeySelection == "paper" && monsterSelection == "scissors"):
		return "Monster win"
	if (monkeySelection == "scissors" && monsterSelection == "rock"):
		return "Monster win"
	elif (monkeySelection == "scissors" && monsterSelection == "paper"):
		return "You win"
	elif (monkeySelection == "scissors" && monsterSelection == "scissors"):
		return "draw"