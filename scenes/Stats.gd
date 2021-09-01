extends Resource

class_name Stats

var max_health: int
var health: int 
var max_soul: int
var soul: int

var strength: int
var vitality: int
var intelligence: int
var dexterity: int

var base_level: int = 1
var base_experience: int = 0

func set_stats(new_stats: Dictionary):
	max_health = new_stats["max_hp"]
	health = max_health
	max_soul = new_stats["max_sp"]
	soul = max_soul
	strength = new_stats["str"]
	vitality = new_stats["vit"]
	intelligence = new_stats["int"]
	dexterity = new_stats["dex"]
