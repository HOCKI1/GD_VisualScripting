@tool
extends EditorPlugin
const MainVSPanel = preload("res://addons/testplugin/VisualScriptEditGraph.tscn")
const VSGraphLogic = preload("res://addons/testplugin/VSGraphLogic.gd")

var MainVSPanel_instance
var MainVSPanel_x
var MainVSPanel_y
var BackgroundPanel

func _enter_tree():
	# Initialization of the plugin goes here.
	MainVSPanel_x = get_editor_interface().get_editor_main_screen().size.x
	MainVSPanel_y = get_editor_interface().get_editor_main_screen().size.y - 40
	MainVSPanel_instance = MainVSPanel.instantiate()
	BackgroundPanel = MainVSPanel_instance.get_node("Panel")
	#BackgroundPanel.call_deferred("size", Vector2(MainVSPanel_x,MainVSPanel_y))
	
	print(get_editor_interface().get_editor_main_screen().size.x)
	print(get_editor_interface().get_editor_main_screen().size.y)
	
	get_editor_interface().get_editor_main_screen().add_child(MainVSPanel_instance)
	_make_visible(false)
	


func _exit_tree():
	if MainVSPanel_instance:
		MainVSPanel_instance.queue_free()


func _has_main_screen():
	return true


func _make_visible(visible):
	if MainVSPanel_instance:
		MainVSPanel_instance.visible = visible


func _get_plugin_name():
	return "Visual Scripting"


func _get_plugin_icon():
	# Must return some kind of Texture for the icon.
	return get_editor_interface().get_base_control().get_theme_icon("Script", "EditorIcons")
