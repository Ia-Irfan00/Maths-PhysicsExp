class_name AnomalyDirector
extends Node


@export var sequence: Array[AnomalyDirector] = []

var _index: int = 0

signal anomaly_armed(index: int)
signal sequence_complete
