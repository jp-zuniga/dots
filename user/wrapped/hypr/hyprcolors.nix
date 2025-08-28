{
  lib,
  theme,
}: let
  toHyprColor = hex: let
    cleanHex = builtins.replaceStrings ["#"] [""] hex;
    paddedHex =
      if builtins.stringLength cleanHex == 3
      then builtins.concatStrings (map (c: c + c) (lib.stringToCharacters cleanHex))
      else cleanHex;
  in
    "0xff" + paddedHex;

  hyprColors = {
    bg = toHyprColor theme.base00;
    surface = toHyprColor theme.base01;
    overlay = toHyprColor theme.base02;
    muted = toHyprColor theme.base03;
    subtle = toHyprColor theme.base04;
    text = toHyprColor theme.base05;
    love = toHyprColor theme.base06;
    gold = toHyprColor theme.base07;
    rose = toHyprColor theme.base08;
    pine = toHyprColor theme.base09;
    foam = toHyprColor theme.base0A;
    iris = toHyprColor theme.base0B;
    highlightLow = toHyprColor theme.base0D;
    highlightMed = toHyprColor theme.base0E;
    highlightHigh = toHyprColor theme.base0F;
  };
in
  hyprColors
