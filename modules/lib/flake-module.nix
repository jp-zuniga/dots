{
  config,
  lib,
  ...
}: {
  options.flake.lib = lib.mkOption {
    default = {};
    description = "Shared library functions.";
    type = lib.types.attrsOf lib.types.raw;
  };

  config.flake.lib = {
    capitalize = import ./capitalize.nix {inherit lib;};
    toTOML = import ./to-toml.nix {inherit lib;};
  };
}
