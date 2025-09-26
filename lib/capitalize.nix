{lib}: {
  capitalize = str: let
    first = lib.substring 0 1 str;
    rest = lib.substring 1 (lib.stringLength str - 1) str;
  in
    lib.toUpper first + rest;
}
