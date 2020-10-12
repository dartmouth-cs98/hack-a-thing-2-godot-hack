extends Node2D

func _ready():
	var selfPeerID = get_tree().get_network_unique_id()
	
	# Load player
	var my_player = preload("res://player.tscn").instance()
	my_player.set_name(str(selfPeerID))
	my_player.set_network_master(selfPeerID)
	get_node("/root/world/players").add_child(my_player)
	#get_tree().get_root().add_child(new_player)
	var info = Network.self_data
	my_player.init(info.name, info.position, false)
