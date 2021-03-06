extends Node


#AUDIO
var VolumeMaster:float = 0.0 setget set_volume_master
var VolumeMusic:float = 0.0 setget set_volume_music
var VolumeSFX:float = 0.0 setget set_volume_sfx
var VolumeRange:float = 24 + 80

func _ready()->void:
	pass

#AUDIO
func get_volumes()->void:
	var Master:float = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))	
	var Music:float = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
	var SFX:float = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX"))
	
	set_volume_master(range_lerp(Master, -80.0, 24.0, 0.0, 1.0))
	set_volume_music(range_lerp(Music, -80.0, 24.0, 0.0, 1.0))
	set_volume_sfx(range_lerp(SFX, -80.0, 24.0, 0.0, 1.0))

func set_volume_master(volume:float)->void:
	VolumeMaster = clamp(volume, 0.0, 1.0)
	var Master = lerp(-80, 24, VolumeMaster)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), Master)

func set_volume_music(volume:float)->void:
	VolumeMusic = clamp(volume, 0.0, 1.0)
	var Music = lerp(-80, 24, VolumeMusic)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), Music)

func set_volume_sfx(volume:float)->void:
	VolumeSFX = clamp(volume, 0.0, 1.0)
	var SFX = lerp(-80, 24, VolumeSFX)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), SFX)
