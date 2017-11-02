extends Node2D

onready var rockButton = get_node("hbcJKP/btnRock")
onready var paperButton = get_node("hbcJKP/btnPaper")
onready var scissorsButton = get_node("hbcJKP/btnScissors")
onready var monkeyPlayerSprite = get_node("gdcMonkey/sprMonkeyPlayer")
onready var monsterPlayerSprite = get_node("gdcMonster/sprMonsterPlayer")

onready var monkeySelection
onready var monsterSelection

onready var resultDialog = get_node("resultDialog")
onready var youWin = false

onready var cheers = get_node("lblWin")

func _ready():
	set_process(true)

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
		youWin = true
		return "You win"
	if (monkeySelection == "paper" && monsterSelection == "rock"):
		youWin = true
		return "You win"
	elif (monkeySelection == "paper" && monsterSelection == "paper"):
		return "draw"
	elif (monkeySelection == "paper" && monsterSelection == "scissors"):
		return "Monster win"
	if (monkeySelection == "scissors" && monsterSelection == "rock"):
		return "Monster win"
	elif (monkeySelection == "scissors" && monsterSelection == "paper"):
		youWin = true
		return "You win"
	elif (monkeySelection == "scissors" && monsterSelection == "scissors"):
		return "draw"

func _on_resultDialog_popup_hide():
	monkeyPlayerSprite.set_frame(3)
	monsterPlayerSprite.set_frame(3)

func _process(delta):
	if (youWin):
		cheers.show()
	else:
		cheers.hide()

func _on_Button_pressed():
	youWin = false
