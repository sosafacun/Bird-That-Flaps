extends Node2D

func _ready():
	var clouds = [$Cloud1Bottom, $Cloud2Bottom, $Cloud1Top, $Cloud2Top]
	var cloud = clouds[randi()%len(clouds)]
	cloud.visible = true
	$CloudDespawn.start()


func _on_cloud_despawn_timeout():
	queue_free()
