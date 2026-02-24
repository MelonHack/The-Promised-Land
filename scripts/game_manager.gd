extends Node2D

#region map
var mapUnlockPQuality = {"Roadside":0, "City":5, "Grove":12, "Desert":18, "Plain":30, "Hell":60, "Heaven":90, "The Promised Land":150}
var mapNextPQuality = {"Roadside":5, "City":12, "Grove":18, "Desert":30, "Plain":60, "Hell":90, "Heaven":150, "The Promised Land":150}
var maps = {"Roadside":1, "City":3, "Grove":4, "Desert":-1, "Plain":8, "Hell":15, "Heaven":20, "The Promised Land":100}
var mapHarmfulGas = {"Roadside":1, "City":5, "Grove":8, "Desert":12, "Plain":18, "Hell":30, "Heaven":22, "The Promised Land":15}
var currentMap = "Roadside"
var mapElectricity = {"Roadside":1.0, "City":1.1, "Grove":1.0, "Desert":1.2, "Plain":1.1, "Hell":1.6, "Heaven":1.3, "The Promised Land":0.8}
var mapUnlocked = {"Roadside":true, "City":false, "Grove":false, "Desert":false, "Plain":false, "Hell":false, "Heaven":false, "The Promised Land":false}
# check if map unlocked based on plant quality
func updateMapUnlockStatus():
	if plantQuality >= mapUnlockPQuality["Roadside"]:
		mapUnlocked["Roadside"] = true
	if plantQuality >= mapUnlockPQuality["City"]:
		mapUnlocked["City"] = true
	if plantQuality >= mapUnlockPQuality["Grove"]:
		mapUnlocked["Grove"] = true
	if plantQuality >= mapUnlockPQuality["Desert"]:
		mapUnlocked["Desert"] = true
	if plantQuality >= mapUnlockPQuality["Plain"]:
		mapUnlocked["Plain"] = true
	if plantQuality >= mapUnlockPQuality["Hell"]:
		mapUnlocked["Hell"] = true
	if plantQuality >= mapUnlockPQuality["Heaven"]:
		mapUnlocked["Heaven"] = true
	if plantQuality >= mapUnlockPQuality["The Promised Land"]:
		mapUnlocked["The Promised Land"] = true
	updateMapIcon()

func updateMapIcon():
	if mapUnlocked["Roadside"]:
		$"../UI_Manager/Control/mapSection/mapSelection/Roadside".disabled = false
	else:
		$"../UI_Manager/Control/mapSection/mapSelection/Roadside".disabled = true
		
	if mapUnlocked["City"]:
		$"../UI_Manager/Control/mapSection/mapSelection/City".disabled = false
	else:
		$"../UI_Manager/Control/mapSection/mapSelection/City".disabled = true
		
	if mapUnlocked["Grove"]:
		$"../UI_Manager/Control/mapSection/mapSelection/Grove".disabled = false
	else:
		$"../UI_Manager/Control/mapSection/mapSelection/Grove".disabled = true
		
	if mapUnlocked["Desert"]:
		$"../UI_Manager/Control/mapSection/mapSelection/Desert".disabled = false
	else:
		$"../UI_Manager/Control/mapSection/mapSelection/Desert".disabled = true
		
	if mapUnlocked["Plain"]:
		$"../UI_Manager/Control/mapSection/mapSelection/Plain".disabled = false
	else:
		$"../UI_Manager/Control/mapSection/mapSelection/Plain".disabled = true
		
	if mapUnlocked["Hell"]:
		$"../UI_Manager/Control/mapSection/mapSelection/Hell".disabled = false
	else:
		$"../UI_Manager/Control/mapSection/mapSelection/Hell".disabled = true
		
	if mapUnlocked["Heaven"]:
		$"../UI_Manager/Control/mapSection/mapSelection/Heaven".disabled = false
	else:
		$"../UI_Manager/Control/mapSection/mapSelection/Heaven".disabled = true
		
	if mapUnlocked["The Promised Land"]:
		$"../UI_Manager/Control/mapSection/mapSelection/ThePromisedLand".disabled = false
	else:
		$"../UI_Manager/Control/mapSection/mapSelection/ThePromisedLand".disabled = true
		

#endregion

# multiplied rate by 1 so that it's easier to show
#region main
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# initializing variables
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#debugPrintAllStats()
	plantQuality += QualityGrowthRate * delta
	update()

	
#endregion

#region pet
# pets stuff
var pets = {"cow":false,"fox":false,"pixie":false,"goat":false,"bear":false,"skeleton":false,"demon":false,"angel":false,"Kobe Bryant":false,"The Plant":false}
var petsOwned = ["","","",""]
var pp = 0.0
var waterQuality = 0.0
var lightQuality = 0.0
var plantQuality = 1.0
var gambleLuck = 1.0
var reverseDebuff = false
var truckLevel = 0
var ppGainMultiplier = 1.0
var electricityCostMultiplier = 1.0
var fertilizerEffectMultiplier = 1.0
var harmfulGasReleaseMultiplier = 1.0
# updates pet buff
func updatePets():
	# pets' change in stats
	# roadside
	# too bad nothing
	
	#city
	# nothing
	
	# Grove
	# fox buff
	var electricityCostIncrease_FromFox = -0.08
	# goat buff
	var fertilizerEffectIncrease_FromGoat = 0.15
	
	# desert
	# pixie buff
	var gambleLuck_FromPixie = 0.15
	
	# Plains
	# cow buff
	var ppGainIncrease_FromCow = 0.12
	# bear buff
	var waterQualityIncrease_FromBear = 2
	
	# hell
	# skeleton buff
	#var reverseDebuff_FromSkeleton = true
	# demon buff
	var lightQualityIncrease_FromDemon = 3
	var waterQualityIncrease_FromDemon = -2
	
	# heaven
	# angel buff
	var waterQualityIncrease_FromAngel = 3
	var electricityCostIncrease_FromAngel = 0.25
	
	# kobe buff
	var fertilizerEffectIncrease_FromKobe = 0.5
	
	# the promised land
	# The Plant buff
	var harmfulGasReleaseIncrease_FromThePlant = -0.6
	
	# check if has pet
	var hasFox = pets["fox"]
	var hasGoat = pets["goat"]
	var hasPixie = pets["pixie"]
	var hasCow = pets["cow"]
	var hasBear = pets["bear"]
	var hasSkeleton = pets["skeleton"]
	var hasDemon = pets["demon"]
	var hasAngel = pets["angel"]
	var hasKobe = pets["Kobe Bryant"]
	var hasThePlant = pets["The Plant"]
	pets = {"cow":false,"fox":false,"pixie":false,"goat":false,"bear":false,"skeleton":false,"demon":false,"angel":false,"Kobe Bryant":false,"The Plant":false}

	
	# check which pets are present
	for pet in petsOwned:
		for type in pets:
			if pet == type:
				pets[type] = true
	# apply buffs from pets
	if hasFox:
		electricityCostMultiplier += electricityCostIncrease_FromFox
	if hasGoat:
		fertilizerEffectMultiplier += fertilizerEffectIncrease_FromGoat
	if hasPixie:
		gambleLuck += gambleLuck_FromPixie
	if hasCow:
		ppGainMultiplier += ppGainIncrease_FromCow
	if hasBear:
		waterQuality += waterQualityIncrease_FromBear
	if hasSkeleton:
		reverseDebuff = true
	else :
		reverseDebuff = false
	if hasDemon:
		waterQuality += waterQualityIncrease_FromDemon
		lightQuality += lightQualityIncrease_FromDemon
	if hasAngel:
		waterQuality += waterQualityIncrease_FromAngel
		electricityCostMultiplier += electricityCostIncrease_FromAngel
	if hasKobe:
		fertilizerEffectMultiplier += fertilizerEffectIncrease_FromKobe
	if hasThePlant:
		harmfulGasReleaseMultiplier += harmfulGasReleaseIncrease_FromThePlant
#endregion

#region accessories
var accessories = {"jersey":false,"bowtie":false,"shoes":false,"fruits":false,"gun":false}
var weatherLuck = 1.0
var specialCustomerRateMultiplier = 1.0
var ppGainRateMultiplier = 1.0
var specialCustomerRequestLevel = 5.0
var accessoryUnlockPQuality = {"jersey":10,"bowtie":25,"shoes":40,"fruits":75,"gun":120}
# update accessories buff
func updateAccessories():
	# var accessories = {"jersey":false,"bowtie":false,"shoes":false,"fruits":false,"gun":false}
	# buffs of each accessories
	var weatherLuckIncrease_FromJersey = 0.2
	var specialCustomerRateIncrease_FromBowtie = 0.2
	var ppGainRateIncrease_FromShoes = -0.3
	var plantQualityIncrease_FromFruits = 1
	var specialCustomerRequestLevelIncrease_FromGun = -2
	
	# check if has accessory
	var hasJersey = accessories["jersey"]
	var hasBowtie = accessories["bowtie"]
	var hasShoes = accessories["shoes"]
	var hasFruits= accessories["fruits"]
	var hasGun = accessories["gun"]
	
	# apply buffs
	if hasJersey:
		weatherLuck += weatherLuckIncrease_FromJersey
	if hasBowtie:
		specialCustomerRateMultiplier += specialCustomerRateIncrease_FromBowtie
	if hasShoes:
		ppGainRateMultiplier += ppGainRateIncrease_FromShoes
	if hasFruits:
		plantQuality += plantQualityIncrease_FromFruits
	if hasGun:
		specialCustomerRequestLevel += specialCustomerRequestLevelIncrease_FromGun
#endregion

#region pot
# pot tiers (8)
var potTiers = {"Basic Pot":[1,1,1], "Copper Pot":[1.05,1.05,1.05], "Metal Pot":[1.1,1.1,1.1], "Mechanical Pot":[1.3,1.3,1.3], "Chinese Yuan Pot":[1.5,1.5,1.5], "Elderitch Pot of Greed":[1.75,1.6,1.6], "Angelic Pot of Light":[1.6,1.75,1.75], "Pot of the Promised Land":[2,2,2]}
var currentPotTier = "Basic Pot"
var waterQualityMultiplier = 1.0
var plantQualityMultiplier = 1.0
# update pot buff
func updatePot():
	for type in potTiers:
		var plantQualityMultiplier_pot = potTiers[type][0]
		var waterQualityMultiplier_pot = potTiers[type][1]
		var fertilizerEffectMultiplier_pot = potTiers[type][2]
		if currentPotTier == type:
			plantQualityMultiplier *= plantQualityMultiplier_pot
			waterQualityMultiplier *= waterQualityMultiplier_pot
			fertilizerEffectMultiplier *= fertilizerEffectMultiplier_pot
#endregion

#region truck
# truck researches, String name : int level
var truckResearches = {"airFiltration1":0, "airFiltration2":0, "efficientWiring1":0, "efficientWiring2":0, "advancedGrowLamp":0}

# updates Truck researches
var airFiltration1 = truckResearches["airFiltration1"]
var efficientWiring1 = truckResearches["efficientWiring1"]
var efficientWiring2 = truckResearches["efficientWiring2"]
var advancedGrowLamp = truckResearches["advancedGrowLamp"]
var airFiltration2 = truckResearches["airFiltration2"]
func updateTruckResearches():
	
	baseHarmfulGas += airFiltration1*(-8) + airFiltration2*(-15)
	electricityCostMultiplier += efficientWiring1*(-0.25) + efficientWiring2*(-0.45)
	lightQuality += advancedGrowLamp*2
#endregion

#region fertilizer
var fertilizers = ["Basic Fertilizer","Mineral Mix","Nitrogen Rush","Toxic Catalyst","Hydro Booster","Celestial Infusion"];
var applyF1 = false
var removeF1 = false
var applyF2 = false
var removeF2 = false
var applyF3 = false
var removeF3 = false
var applyF4 = false
var removeF4 = false
var applyF5 = false
var removeF5 = false
var applyF6 = false
var removeF6 = false
@onready var fertilizer1 = $"../UI_Manager/Control/fertilizerSection/fetilizerTab/ColorRect/Control/butt_fert1"
@onready var fertilizer2 = $"../UI_Manager/Control/fertilizerSection/fetilizerTab/ColorRect/Control2/butt_fert2"
@onready var fertilizer3 = $"../UI_Manager/Control/fertilizerSection/fetilizerTab/ColorRect/Control3/butt_fert3"
@onready var fertilizer4 = $"../UI_Manager/Control/fertilizerSection/fetilizerTab/ColorRect/Control4/butt_fert4"
@onready var fertilizer5 = $"../UI_Manager/Control/fertilizerSection/fetilizerTab/ColorRect/Control5/butt_fert5"
@onready var fertilizer6 = $"../UI_Manager/Control/fertilizerSection/fetilizerTab/ColorRect/Control6/butt_fert6"


func updateFertilizerStatus():
	if applyF1:
		fertilizer1.updateFertilizerBuff(true)
	elif removeF1:
		fertilizer1.updateFertilizerBuff(false)
		removeF1 = false
		
	if applyF2:
		fertilizer2.updateFertilizerBuff(true)
	elif removeF2:
		fertilizer2.updateFertilizerBuff(false)
		removeF2 = false
		
	if applyF3:
		fertilizer3.updateFertilizerBuff(true)
	elif removeF3:
		fertilizer3.updateFertilizerBuff(false)
		removeF3 = false
		
	if applyF4:
		fertilizer4.updateFertilizerBuff(true)
	elif removeF4:
		fertilizer4.updateFertilizerBuff(false)
		removeF4 = false
		
	if applyF5:
		fertilizer5.updateFertilizerBuff(true)
	elif removeF5:
		fertilizer5.updateFertilizerBuff(false)
		removeF5 = false
		
	if applyF6:
		fertilizer6.updateFertilizerBuff(true)
	elif removeF6:
		fertilizer6.updateFertilizerBuff(false)
		removeF6 = false


func _on_butt_fert_1_fertilizer_used() -> void:
	applyF1 = true
	fertilizerActiveCount += 1
func _on_basic_fertilizer_timer_timeout() -> void:
	applyF1 = false
	removeF1 = true
	fertilizerActiveCount -= 1
	
func _on_butt_fert_2_fertilizer_used() -> void:
	applyF2 = true
	fertilizerActiveCount += 1
func _on_mineral_mix_timer_timeout() -> void:
	applyF2 = false
	removeF2 = true
	fertilizerActiveCount -= 1

func _on_butt_fert_3_fertilizer_used() -> void:
	applyF3 = true
	fertilizerActiveCount += 1
func _on_nitrogen_rush_timer_timeout() -> void:
	applyF3 = false
	removeF3 = true
	fertilizerActiveCount -= 1

func _on_butt_fert_4_fertilizer_used() -> void:
	applyF4 = true
	fertilizerActiveCount += 1
func _on_toxic_catalyst_timer_timeout() -> void:
	applyF4 = false
	removeF4 = true
	fertilizerActiveCount -= 1

func _on_butt_fert_5_fertilizer_used() -> void:
	applyF5 = true
	fertilizerActiveCount += 1
func _on_hydro_booster_timer_timeout() -> void:
	applyF5 = false
	removeF5 = true
	fertilizerActiveCount -= 1

func _on_butt_fert_6_fertilizer_used() -> void:
	applyF6 = true
	fertilizerActiveCount += 1
func _on_celestial_infusion_timer_timeout() -> void:
	applyF6 = false
	removeF6 = true
	fertilizerActiveCount -= 1
#endregion

#region weather
# effects either buff or debuff. they come from weather and fertilizer
var weatherTypes = ["sunny","rain","storm","drought","toxic wind"]
var weather = "sunny"
@onready var rainShade = $"../rainShade"
func updateWeather():
	if weather == "sunny":
		lightQuality += 2
		waterQuality -= 1
		ppGainMultiplier += 0.05
		fade_out_darkness(1.5)
		$"../rainShade/ColorRect".material.set_shader_parameter("rain_amount", 50.0)
	elif weather == "rain":
		waterQuality += 3
		lightQuality -= 1
		electricityCostMultiplier -= 0.05
		rainShade.visible = true
		fade_in_darkness(1.5)
		$"../rainShade/ColorRect".material.set_shader_parameter("rain_amount", 50.0)
	elif weather == "storm":
		waterQuality += 4
		lightQuality -= 2
		harmfulGasReleaseMultiplier += 0.15
		fertilizerEffectMultiplier += 0.1
		rainShade.visible = true
		fade_in_darkness(1.5)
		$"../rainShade/ColorRect".material.set_shader_parameter("rain_amount", 200.0)
	elif weather == "drought":
		waterQuality -= 3
		lightQuality += 2
		ppGainMultiplier -= 0.2
		fade_out_darkness(1.5)
		$"../rainShade/ColorRect".material.set_shader_parameter("rain_amount", 50.0)
	elif weather == "toxic wind":
		harmfulGasReleaseMultiplier += 0.25
		ppGainMultiplier -= 0.1
		lightQuality += 1
		rainShade.visible = true
		fade_in_darkness(1.5)
		$"../rainShade/ColorRect".material.set_shader_parameter("rain_amount", 100.0)

func fade_in_darkness(duration := 1.0):
	var tween = create_tween()
	rainShade.modulate.a = 0.0
	tween.tween_property(rainShade, "modulate:a", 0.5, duration)
func fade_out_darkness(duration := 1.0):
	var tween = create_tween()
	tween.tween_property(rainShade, "modulate:a", 0.0, duration)
var chanceSunny = 0.5
var chanceRain = 0.25
var chanceStorm = 0.12
var chanceDrought = 0.05
var chanceToxicWind = 0.0
func _on_weather_change_timer_timeout() -> void:
	var rngWeather = randf()
	if rngWeather > chanceSunny:
		weather = "sunny"
	elif rngWeather > chanceRain:
		weather = "rain"
	elif rngWeather > chanceStorm:
		weather = "storm"
	elif rngWeather > chanceDrought:
		weather = "drought"
	elif rngWeather > chanceToxicWind:
		weather = "toxic wind"
#endregion

#region elecctricity cost
var BaseElectricityUse = 1
var researchCount=0
var fertilizerActiveCount=0
var electricityCost=0
func updateElectricityCost():
	# add electricity cost from truck research. 0.8 for each research
	researchCount = airFiltration1 + airFiltration2 + efficientWiring1 + efficientWiring2 + advancedGrowLamp
	BaseElectricityUse += researchCount*(0.8) + fertilizerActiveCount*(0.3)
	electricityCost = BaseElectricityUse*electricityCostMultiplier
#endregion

#region update all
var baseHarmfulGas = mapHarmfulGas[currentMap]
var gasPenalty = 1.0
@onready var QualityGrowthRate = 0.02 * waterFactor * lightFactor * gasPenalty
@onready var initialPlantQuality = maps[currentMap]
# update plantQuality
# add map buffs (remember to add special properties!)
func _on_map_selection_map_changed() -> void:
	initialPlantQuality = maps[currentMap]
	plantQuality = initialPlantQuality
	# update pets available
	$"../petsAndAccessoriesManager".checkAvailablePets()
	$"../UI_Manager/Control/petSection/petTab/availablePetDropdown".update_pet_dropdown()
func update():
	# add initial values of stats
	weatherLuck = 1.0
	specialCustomerRateMultiplier = 1.0
	ppGainRateMultiplier = 1.0
	specialCustomerRequestLevel = 5
	waterQuality = 0.0
	lightQuality = 0.0
	gambleLuck = 1.0
	reverseDebuff = false
	ppGainMultiplier = 1.0
	electricityCostMultiplier = 1.0
	fertilizerEffectMultiplier = 1.0
	harmfulGasReleaseMultiplier = 1.0
	baseHarmfulGas = mapHarmfulGas[currentMap]
	BaseElectricityUse = 1
	
	
	# additive increase to multipliers + reverseDebuff
	# update pet buffs
	updatePets()
	# update accessories buffs
	updateAccessories()
	# update truck research buffs
	updateTruckResearches()
	# update pot
	updatePot()
	# update fertilizer
	updateFertilizerStatus()
	# add effects
	updateWeather()
	
	# update harmful gas
	baseHarmfulGas *= harmfulGasReleaseMultiplier
	gasPenalty = max(1 - (baseHarmfulGas * 0.01),0.1)
	if gasPenalty >= 1:
		gasPenalty = 1
	
	# electricity cost
	updateElectricityCost()
	var electricityMapMultiplier = mapElectricity[currentMap]
	electricityCost *= electricityMapMultiplier
	
	# check if accessory should unlock
		# check if accessory unlocked
	for accessory in accessories:
		if plantQuality >= accessoryUnlockPQuality[accessory]:
			accessories[accessory] = true
	
	if reverseDebuff:
		gasPenalty = 1.5
	
	# plant growth
	QualityGrowthRate = 0.02 * waterFactor * lightFactor * gasPenalty
			
	# check if map unlocked
	updateMapUnlockStatus()
#endregion

#region pp gain timer
var amountGained=0
var waterFactor=1
var lightFactor=1
func _on_pp_gain_timer_timeout() -> void:
	waterFactor = max(1 + (waterQuality * 0.15),0.01)
	lightFactor = max(1 + (lightQuality * 0.12),0.01)
	var electricityOverloadPenalty = 0
	if amountGained > 0 and electricityCost >= amountGained*0.35:
		electricityOverloadPenalty = max((1 - ((electricityCost / amountGained) * 0.5)),0.5)
	amountGained = plantQuality * (1-electricityOverloadPenalty) * 8 * (ppGainMultiplier) * waterFactor * lightFactor * gasPenalty
	# electricity cost
	if pp >= electricityCost:
		amountGained -= electricityCost
	pp = max((pp + amountGained * gainPauseMultiplier), 0)
#endregion

#region helper functions
# rounding function
func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
	
# print all stats in terminal
func debugPrintAllStats():
	print(
	"daaaaaaaaaaaaaaaaaaaaaaataaaaaaaaaaaaaaaaaaaaaaaaaaaa\nweatherLuck: " + str(weatherLuck) + "\n" +
	"specialCustomerRateMultiplier: " + str(specialCustomerRateMultiplier) + "\n" +
	"ppGainRateMultiplier: " + str(ppGainRateMultiplier) + "\n" +
	"specialCustomerRequestLevel: " + str(specialCustomerRequestLevel) + "\n" +
	"pp: " + str(pp) + "\n" +
	"waterQuality: " + str(waterQuality) + "\n" +
	"currentMap: " + str(currentMap) + "\n" +
	"truckLevel: " + str(truckLevel) + "\n" +
	"ppGainMultiplier: " + str(ppGainMultiplier) + "\n" +
	"electricityCostMultiplier: " + str(electricityCostMultiplier) + "\n" +
	"gambleLuck: " + str(gambleLuck) + "\n" +
	"fertilizerEffectMultiplier: " + str(fertilizerEffectMultiplier) + "\n" +
	"reverseDebuff: " + str(reverseDebuff) + "\n" +
	"harmfulGasReleaseMultiplier: " + str(harmfulGasReleaseMultiplier) + "\n" +
	"lightQuality: " + str(lightQuality) + "\n" +
	"plantQuality: " + str(plantQuality))
#endregion

#region pause
var gainPauseMultiplier = 1

func _on_quit_pressed() -> void:
	get_tree().quit()
#endregion
