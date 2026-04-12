{
  lib,
  theme,
  ...
}: let
  inherit (theme) colors;

  hexColor = hex: let
    cleanHex = builtins.replaceStrings ["#"] [""] hex;
    paddedHex =
      if builtins.stringLength cleanHex == 3
      then builtins.concatStrings (map (c: c + c) (lib.stringToCharacters cleanHex))
      else cleanHex;
  in
    "0xff" + paddedHex;
in {
  foreground = hexColor colors.foreground;
  accent = hexColor colors.accent;
  base = hexColor colors.base;
  black = hexColor colors.black;
  red = hexColor colors.red;
  green = hexColor colors.green;
  yellow = hexColor colors.yellow;
  blue = hexColor colors.blue;
  magenta = hexColor colors.magenta;
  cyan = hexColor colors.cyan;
  white = hexColor colors.white;
  iris = hexColor colors.iris;
}
