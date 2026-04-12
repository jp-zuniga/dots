{lib, ...}: {
  options.flake.lib = lib.mkOption {
    default = {};
    description = "Shared library functions.";
    type = lib.types.attrsOf lib.types.raw;
  };

  config.flake.lib = let
    capitalize = import ./capitalize.nix {inherit lib;};
  in
    {
      inherit capitalize;
      toTOML = import ./to-toml.nix {inherit lib;};
    }
    // import ./case-convert.nix {inherit capitalize lib;};
}
