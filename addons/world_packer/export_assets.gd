extends SceneTree
## The world assets' packs (WorldAssetsPacker) exported into the directory given after "--",
## headless, in a project of no libmaszyna (the world assets' `make packs`):
##   godot-double --headless --path <project> -s res://addons/world_packer/export_assets.gd -- <dir>


func _initialize() -> void:
    # after the autoloads (BiomesServer, which the biomes' scripts name) are in the tree
    await process_frame
    var dir: String = OS.get_cmdline_user_args()[0]
    var exported: bool = (load("res://addons/world_packer/world_assets_packer.gd") as GDScript).export_all(dir)
    print("World assets: ", "exported into " + dir if exported else "FAILED")
    quit(0 if exported else 1)
