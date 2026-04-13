{lib, ...}: let
  tokenize = str:
    builtins.filter builtins.isString (builtins.split "[ _-]+" str);
in {
  toKebabCase = str:
    lib.concatStringsSep "-" (map lib.toLower (tokenize str));

  toSnakeCase = str:
    lib.concatStringsSep "_" (map lib.toLower (tokenize str));
}
