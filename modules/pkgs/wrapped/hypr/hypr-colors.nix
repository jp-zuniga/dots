{
  lib,
  theme,
  ...
}: let
  hexColor = hex: let
    cleanHex = builtins.replaceStrings ["#"] [""] hex;
    paddedHex =
      if builtins.stringLength cleanHex == 3
      then builtins.concatStrings (map (c: c + c) (lib.stringToCharacters cleanHex))
      else cleanHex;
  in
    "0xff" + paddedHex;
in {
  bg = hexColor theme.bg;
  surface = hexColor theme.surface;
  overlay = hexColor theme.overlay;
  muted = hexColor theme.muted;
  subtle = hexColor theme.subtle;
  text = hexColor theme.text;
  love = hexColor theme.love;
  gold = hexColor theme.gold;
  rose = hexColor theme.rose;
  pine = hexColor theme.pine;
  foam = hexColor theme.foam;
  iris = hexColor theme.iris;
  highlightLow = hexColor theme.highlightLow;
  highlightMed = hexColor theme.highlightMed;
  highlightHigh = hexColor theme.highlightHigh;
}
