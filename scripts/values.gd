extends Resource
class_name valueHolder

var globalVolume = 1
var muted = false
var meriColor = Color8(219, 139, 92, 255)
var caraColor = Color8(96, 105, 64, 255)
var bonColor = Color8(240, 217, 115, 225)
var CurtainState = "Closed"
var knife = "true"
var invGlobal = []
var invCurrentGlobal = 0
var cam = "true"
var firewood = true
var fireplace = "empty"
var chestOpen = false
var jewleryRightOpen = false
var jewleryLeftOpen = false
var objectDicts = {"knife": "res://inv/Paint Layer 4.PNG",
	"key": "res://inv/Paint Layer 27.PNG",
	"cam": "res://inv/Paint Layer 26.PNG",
	"firewood": "res://inv/firewoodInv.PNG",
	"journal": "res://inv/jounalInv.PNG",
	"meriPhoto": "res://inv/meriPhotoInv.PNG",
	"candle": "res://inv/candleInv.PNG",
	"makeup": "res://assets/makeup.PNG",
	"matches": "res://inv/Paint Layer 1.PNG",
	"perfume": "res://inv/perfumeInv.PNG",
	"mouse": "res://inv/mouseInv.PNG",
	"caraPhoto": "res://inv/caraPhotoInv.PNG",
	"firePhoto": "res://inv/firephotoInv.PNG"}
var dressed = false
var bookOnStand = false
var meriInside = false
var bonInside = false
var meriPerfume = false
var meriMakeup = false
var candle = true
var makeup = true
var matches = true
var meriPhotoTaken = false
var perfume = true
var candleInChest = false
var candleLit = false
var bonEaten = false
var mouse = true
var firePhotoTaken = false
var caraPhotoTaken = false
var firePhotoInJournal = false
var caraPhotoInJournal = false
var meriPhotoInJournal = false
