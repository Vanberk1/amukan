extends Resource

class_name Stats

var max_health: int
var health: int 
var max_mana: int
var mana: int

var strength: int
var vitality: int
var intelligence: int
var dexterity: int

func set_stats(new_stats):
	strength = new_stats["str"]
	vitality = new_stats["vit"]
	intelligence = new_stats["int"]
	dexterity = new_stats["dex"]
