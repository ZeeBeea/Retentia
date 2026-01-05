extends Node2D


var meriColor = Color8(219, 139, 92, 255)
var caraColor = Color8(96, 105, 64, 255)
var bonColor = Color8(240, 217, 115, 225)
var objectDicts = {"knife": "res://inv/Paint Layer 4.PNG",
	"key": "res://inv/Paint Layer 27.PNG",
	"cam": "res://inv/Paint Layer 26.PNG",
	"firewood": "res://inv/firewoodInv.PNG",
	"journal": "res://inv/jounalInv.PNG",
	"meriPhoto": "res://inv/meriphotoInv.PNG",
	"candle": "res://inv/candleInv.PNG",
	"makeup": "res://inv/makeup.png",
	"matches": "res://inv/Paint Layer 1.PNG",
	"perfume": "res://inv/perfumeInv.PNG",
	"mouse": "res://inv/mouseInv.PNG",
	"caraPhoto": "res://inv/caraPhotoInv.PNG",
	"firePhoto": "res://inv/firephotoInv.PNG",
	"caraUndressedPhoto": "res://inv/caraPhotoUndressInv.png",
	"gem": "res://livingRoomItems/gem.PNG",
	"blackPaint": "res://livingRoomItems/blackPaint.PNG",
	"blackPaintbrush": "res://livingRoomItems/blackPaintbrush.PNG",
	"blood": "res://livingRoomItems/blood.PNG",
	"bluebell":"res://livingRoomItems/bluebell.PNG",
	"bluePaint": "res://livingRoomItems/bluePaint.PNG",
	"bluePaintbrush": "res://livingRoomItems/bluePaintbrush.PNG",
	"bluePigment": "res://livingRoomItems/BluePast.PNG",
	"greenPigment": "res://livingRoomItems/coolGemPowder.PNG",
	"whitePigment": "res://livingRoomItems/eggPowder.PNG",
	"eggshell": "res://livingRoomItems/eggshell.PNG",
	"greenPaint": "res://livingRoomItems/greenPaint.PNG",
	"greenPaintbrush": "res://livingRoomItems/greenPaintbrush.PNG",
	"hair": "res://livingRoomItems/hair.PNG",
	"paintbrush": "res://livingRoomItems/paintbrush.PNG",
	"redPaint": "res://livingRoomItems/redPaint.PNG",
	"redPaintbrush": "res://livingRoomItems/redPaintbrush.PNG",
	"blackPigment": "res://livingRoomItems/soot.PNG",
	"stick": "res://livingRoomItems/stcik.PNG",
	"sunflower":"res://livingRoomItems/sunflower.PNG",
	"whitePaint": "res://livingRoomItems/whitePaint.PNG",
	"whitePaintbrush": "res://livingRoomItems/whitePaintbrush.PNG",
	"yellowPaint": "res://livingRoomItems/yellowPaint.PNG",
	"yellowPaintbrush": "res://livingRoomItems/yellowPajntbrush.PNG",
	"yellowPigment": "res://livingRoomItems/yellowPaste.PNG",
	"canvas": "res://livingroom/doorWall/canvas.PNG",
	"spoon": "res://livingroom/boxInt/spoon.PNG"
	}
	
	
	
	
var invCurrentGlobal = 0
var invGlobal = ["sunflower"]

const globalVolume = "globalVolume"
const muted = "muted"
const CurtainState = "CurtainState"
const knife = "knife"
const cam = "cam"
const firewood = "firewood"
const fireplace = "fireplace"
const chestOpen = "chestOpen"
const jewleryRightOpen = "jewleryRightOpen"
const jewleryLeftOpen = "jewleryLeftOpen"
const dressed = "dressed"
const bookOnStand = "bookOnStand"
const meriInside = "meriInside"
const bonInside = "bonInside"
const meriPerfume = "meriPerfume"
const meriMakeup = "meriMakeup"
const candle = "candle"
const makeup = "makeup"
const matches = "matches"
const meriPhotoTaken = "meriPhotoTaken"
const perfume = "perfume"
const candleInChest = "candleInChest"
const candleLit = "candleLit"
const bonEaten = "bonEaten"
const mouse = "mouse"
const firePhotoTaken = "firePhotoTaken"
const caraPhotoTaken = "caraPhotoTaken"
const firePhotoInJournal = "firePhotoInJournal"
const caraPhotoInJournal = "caraPhotoInJournal"
const meriPhotoInJournal = "meriPhotoInJournal"
const caraUndressJournal = "caraUndressJournal"


var saveVars = {"caraUndressJournal": false,
"globalVolume": 1,
"muted": false,
"CurtainState": "Closed",
"knife": true,
"cam": true,
"firewood": true,
"fireplace": "empty",
"chestOpen": false,
"jewleryRightOpen": false,
"jewleryLeftOpen": false,
"dressed": false,
"bookOnStand": false,
"meriInside": false,
"bonInside": false,
"meriPerfume": false,
"meriMakeup": false,
"candle": true,
"makeup": true,
"matches": true,
"meriPhotoTaken": false,
"perfume" : true,
"candleInChest": false,
"candleLit": false,
"bonEaten": false,
"mouse": true,
"firePhotoTaken": false,
"caraPhotoTaken": false,
"firePhotoInJournal": false,
"caraPhotoInJournal": false,
"meriPhotoInJournal": false,

"CurrentRoom": "bedroom",
"gemObtained": false,
"canvasInPainting": false,
"candleLitLivingRoom": false,
"currentInMortar": null

}
#

var defaults = {"caraUndressJournal": false,
"globalVolume": 1,
"muted": false,
"CurtainState": "Closed",
"knife": true,
"cam": true,
"firewood": true,
"fireplace": "empty",
"chestOpen": false,
"jewleryRightOpen": false,
"jewleryLeftOpen": false,
"dressed": false,
"bookOnStand": false,
"meriInside": false,
"bonInside": false,
"meriPerfume": false,
"meriMakeup": false,
"candle": true,
"makeup": true,
"matches": true,
"meriPhotoTaken": false,
"perfume" : true,
"candleInChest": false,
"candleLit": false,
"bonEaten": false,
"mouse": true,
"firePhotoTaken": false,
"caraPhotoTaken": false,
"firePhotoInJournal": false,
"caraPhotoInJournal": false,
"meriPhotoInJournal": false,

"CurrentRoom": "bedroom",
"gemObtained": false,
"canvasInPainting": false,
"candleLitLivingRoom": false,
"currentInMortar": null
}

func save():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	save_file.store_var(saveVars)
	save_file.store_var(invGlobal)
	save_file.close()
	#get_tree().change_scene_to_file("res://menuStart.tscn")
