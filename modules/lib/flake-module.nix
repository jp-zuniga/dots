{
  config,
  lib,
  ...
}: {
  options.flake.lib = lib.mkOption {
    type = lib.types.attrsOf lib.types.raw;
    default = {};
    description = "Shared library functions.";
  };

  config.flake.lib = {
    capitalize = import ./capitalize.nix {inherit lib;};
  };
}
