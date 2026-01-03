extends Sprite2D
var currentBook
var bookToSwitch
signal bookSorted

@onready var dia = $main
# Called when the node enters the scene tree for the first time.
@onready var books = [$".", $"../Book2", $"../Book3", $"../Book4", $"../Book5", $"../Book6", $"../Book7", $"../Book8"]

#@export var size: int

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_book_1_btn_pressed():
	setupShelf($".")
		
func _on_book_2_btn_pressed():
	setupShelf($"../Book2")
func _on_book_3_btn_pressed():
	setupShelf($"../Book3")
func _on_book_4_btn_pressed():
	setupShelf($"../Book4")

func _on_book_5_btn_pressed():
	setupShelf($"../Book5")


func _on_book_6_btn_pressed():
	setupShelf($"../Book6")

func _on_book_7_btn_pressed():
	setupShelf($"../Book7")

func _on_book_8_btn_pressed():
	setupShelf($"../Book8")


func setupShelf(book):
	book.self_modulate = Color(0.5, 0.5, 0.5, 1)
	if currentBook == null:
		currentBook = book
	else:
		bookToSwitch = book
		switchBooks(currentBook, bookToSwitch)
		currentBook = null
		bookToSwitch = null
		

func switchBooks(book1, book2):
	#Switches the books by finding the positon in array, than deletes the values
	var temp = null
	var one 
	var two
	var temp2 = null
	two = books.find(book2)
	one = books.find(book1)
	books[two] = book1
	books[one] = book2
	
	
	#books[7].position.x = 1100 + (books[7].texture.get_width()/2)
	var i = 7
	var shelfSize: int = 1829 
	while i >= 0:
		books[i].position.x = shelfSize - books[i].texture.get_width()*books[i].scale.x/2
		shelfSize = shelfSize - books[i].texture.get_width()*books[i].scale.x
		i = i - 1
		
		
		
	
	#sets the color back to normal
	book1.self_modulate = Color(1, 1, 1, 1)
	book2.self_modulate = Color(1, 1, 1, 1)
	arrayComp(books)
	
func arrayComp(arr):
	var blank = [$"../Book8", $"../Book2", $"../Book4",$"../Book5",  $".", $"../Book7",$"../Book6",  $"../Book3"]
	if arr == blank:
		bookSorted.emit()
	
