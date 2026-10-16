# world-packer

Packs the game's worlds and what they share into the packs the game mounts - Godot addon
`addons/world_packer`, plain GDScript with nothing of libmaszyna, so the packs build in CI without it:

- `WorldPacker` (`world_packer.gd`): a world's sources (`world.scn`, `scenery.res`, `scenario.res`,
  `blocks/<block>/sectors/<id>.drawn.scn|.terrain.res`) into a worlds directory given (the game's
  `worlds/`): `<name>/world.pck`, a pack a block and `<name>.json`, every file under
  `res://worlds/<name>/`. Used by the scenery importer and by a world's
  repository (`export_world.gd`).
- `WorldAssetsPacker` (`world_assets_packer.gd`): every `res://world_assets/<pack>/` of a project into
  `world_assets/<pack>.pck`, imported files as Godot's export takes them, nodes of the group
  `world_assets_preview` left out. Used by the world assets' repository (`export_assets.gd`).

A repository using it has it as a submodule (`vendor/world-packer`) with `addons/world_packer`
linked to `vendor/world-packer/addons/world_packer`.
