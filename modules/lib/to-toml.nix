# - author: nprindle
# - posted by: https://github.com/chessai
# - source: https://github.com/NixOS/nix/issues/3929
#
# licensed under: n/a
#   - no license was found
#   - its inclusion in this repository is licensed under the GPLv3
#     - license: https://github.com/jp-zuniga/dots/blob/main/LICENSE
#
# changes:
#   - rewritten to have no external dependencies and only use `nixpkgs.lib`
#
# ---------------------------------------------------------------------------------------
{lib, ...}: let
  # Escape a TOML key:
  #   - we don't need to add quotes to valid identifiers
  tomlEscapeKey = val:
  # Identifier regex taken from https://toml.io/en/v1.0.0-rc.1#keyvalue-pair
    if builtins.isString val && builtins.match "[A-Za-z0-9_-]+" val != null
    then val
    else builtins.toJSON val;

  # Escape a TOML value
  tomlEscapeValue = builtins.toJSON;

  # Render a TOML value that appears on the right hand side of an equals
  tomlValue = v:
    if builtins.isList v
    then "[${lib.concatMapStringsSep ", " tomlValue v}]"
    else if builtins.isAttrs v
    then "{${builtins.concatStringsSep ", " (lib.mapAttrsToList tomlKV v)}}"
    else tomlEscapeValue v;

  # Render an inline TOML "key = value" pair
  tomlKV = k: v: "${tomlEscapeKey k} = ${tomlValue v}";

  # Turn a prefix like [ "foo" "bar" ] into
  # an escaped header value like "foo.bar"
  dots = lib.concatMapStringsSep "." tomlEscapeKey;

  # Render a TOML table with a header
  tomlTable = oldPrefix: k: v: let
    prefix = oldPrefix ++ [k];
    rest = go prefix v;
  in
    "[${dots prefix}]" + lib.optionalString (rest != "") "\n${rest}";

  # Render a TOML array of attrsets using [[]] notation.
  # 'subtables' should be a list of attrsets.
  tomlTableArray = oldPrefix: k: subtables: let
    prefix = oldPrefix ++ [k];
  in
    lib.concatMapStringsSep "\n\n" (v: let
      rest = go prefix v;
    in
      "[[${dots prefix}]]" + lib.optionalString (rest != "") "\n${rest}")
    subtables;

  # Wrap a string in a list, yielding the empty list if the string is empty
  optionalNonempty = str: lib.optional (str != "") str;

  # Render an attrset into TOML;
  # when nested, 'prefix' will be a list of the keys we're currently in
  go = prefix: attrs: let
    # Convert attrs to a list of { name, value } pairs for partitioning
    attrList = lib.mapAttrsToList (name: value: {inherit name value;}) attrs;

    # Render values that are objects using tables
    # partition returns { right = [ ... ]; wrong = [ ... ]; }
    # right: elements that satisfy the predicate
    tableSplit = lib.partition ({value, ...}: builtins.isAttrs value) attrList;
    tables = tableSplit.right;
    nonTables = tableSplit.wrong;

    tablesToml =
      lib.concatMapStringsSep "\n\n"
      ({
        name,
        value,
      }:
        tomlTable prefix name value)
      tables;

    # Use [[]] syntax only on arrays of attrsets
    tableArraySplit =
      lib.partition
      ({value, ...}: builtins.isList value && value != [] && lib.all builtins.isAttrs value)
      nonTables;

    tableArrays = tableArraySplit.right;
    primitives = tableArraySplit.wrong;

    tableArraysToml =
      lib.concatMapStringsSep "\n\n"
      ({
        name,
        value,
      }:
        tomlTableArray prefix name value)
      tableArrays;

    # Everything else becomes bare "key = value" pairs
    pairsToml = lib.concatMapStringsSep "\n" ({
      name,
      value,
    }:
      tomlKV name value)
    primitives;
  in
    builtins.concatStringsSep "\n\n" (lib.concatMap optionalNonempty [
      pairsToml
      tablesToml
      tableArraysToml
    ]);
in
  attrs: go [] attrs
