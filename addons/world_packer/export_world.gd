extends SceneTree
## The world given after "--" - its sources in the project's res://worlds/<name>/ - packed
## (WorldPacker.pack(): its packs in <name>/ and its description <name>.json beside them, as in the
## game's worlds directory) into the worlds directory given after it; headless, in a project of no
## libmaszyna (a world's `make packs`):
##   godot-double --headless --path <project> -s res://addons/world_packer/export_world.gd -- <name> <worlds dir>

const Packer: GDScript = preload("world_packer.gd")


func _initialize() -> void:
    var world_name: String = OS.get_cmdline_user_args()[0]
    var worlds_dir: String = OS.get_cmdline_user_args()[1]
    var sources: String = ProjectSettings.globalize_path(Packer.RESOURCES_DIR.path_join(world_name))
    var packed: bool = Packer.pack(sources, world_name, worlds_dir)
    print("World %s: " % world_name, "packed into " + worlds_dir if packed else "FAILED")
    quit(0 if packed else 1)
