{
  pkgs,
  theme,
}:
pkgs.writeText "theme.yml" ''
  colourful: true
  filekinds:
    normal: {foreground: "${theme.text}"}
    directory: {foreground: "${theme.foam}"}
    symlink: {foreground: "${theme.highlightHigh}"}
    pipe: {foreground: "${theme.subtle}"}
    block_device: {foreground: "${theme.rose}"}
    char_device: {foreground: "${theme.gold}"}
    socket: {foreground: "${theme.surface}"}
    special: {foreground: "${theme.iris}"}
    executable: {foreground: "${theme.iris}"}
    mount_point: {foreground: "${theme.highlightMed}"}
  perms:
    user_read: {foreground: "${theme.subtle}"}
    user_write: {foreground: "${theme.highlightMed}"}
    user_execute_file: {foreground: "${theme.iris}"}
    user_execute_other: {foreground: "${theme.iris}"}
    group_read: {foreground: "${theme.subtle}"}
    group_write: {foreground: "${theme.highlightMed}"}
    group_execute: {foreground: "${theme.iris}"}
    other_read: {foreground: "${theme.subtle}"}
    other_write: {foreground: "${theme.highlightMed}"}
    other_execute: {foreground: "${theme.iris}"}
    special_user_file: {foreground: "${theme.iris}"}
    special_other: {foreground: "${theme.highlightMed}"}
    attribute: {foreground: "${theme.subtle}"}
  size:
    major: {foreground: "${theme.subtle}"}
    minor: {foreground: "${theme.foam}"}
    number_byte: {foreground: "${theme.subtle}"}
    number_kilo: {foreground: "${theme.highlightHigh}"}
    number_mega: {foreground: "${theme.pine}"}
    number_giga: {foreground: "${theme.iris}"}
    number_huge: {foreground: "${theme.iris}"}
    unit_byte: {foreground: "${theme.subtle}"}
    unit_kilo: {foreground: "${theme.pine}"}
    unit_mega: {foreground: "${theme.iris}"}
    unit_giga: {foreground: "${theme.iris}"}
    unit_huge: {foreground: "${theme.foam}"}
  users:
    user_you: {foreground: "${theme.gold}"}
    user_root: {foreground: "${theme.love}"}
    user_other: {foreground: "${theme.iris}"}
    group_yours: {foreground: "${theme.highlightHigh}"}
    group_other: {foreground: "${theme.muted}"}
    group_root: {foreground: "${theme.love}"}
  links:
    normal: {foreground: "${theme.foam}"}
    multi_link_file: {foreground: "${theme.pine}"}
  git:
    new: {foreground: "${theme.foam}"}
    modified: {foreground: "${theme.gold}"}
    deleted: {foreground: "${theme.love}"}
    renamed: {foreground: "${theme.pine}"}
    typechange: {foreground: "${theme.iris}"}
    ignored: {foreground: "${theme.muted}"}
    conflicted: {foreground: "${theme.rose}"}
  git_repo:
    branch_main: {foreground: "${theme.subtle}"}
    branch_other: {foreground: "${theme.iris}"}
    git_clean: {foreground: "${theme.foam}"}
    git_dirty: {foreground: "${theme.love}"}
  security_context:
    colon: {foreground: "${theme.subtle}"}
    user: {foreground: "${theme.foam}"}
    role: {foreground: "${theme.iris}"}
    typ: {foreground: "${theme.muted}"}
    range: {foreground: "${theme.iris}"}
  file_type:
    image: {foreground: "${theme.gold}"}
    video: {foreground: "${theme.love}"}
    music: {foreground: "${theme.foam}"}
    lossless: {foreground: "${theme.muted}"}
    crypto: {foreground: "${theme.highlightMed}"}
    document: {foreground: "${theme.subtle}"}
    compressed: {foreground: "${theme.iris}"}
    temp: {foreground: "${theme.rose}"}
    compiled: {foreground: "${theme.pine}"}
    build: {foreground: "${theme.muted}"}
    source: {foreground: "${theme.rose}"}
    punctuation: {foreground: "${theme.highlightLow}"}
    date: {foreground: "${theme.pine}"}
    inode: {foreground: "${theme.subtle}"}
    blocks: {foreground: "${theme.highlightHigh}"}
    header: {foreground: "${theme.subtle}"}
    octal: {foreground: "${theme.foam}"}
    flags: {foreground: "${theme.iris}"}
    symlink_path: {foreground: "${theme.foam}"}
    control_char: {foreground: "${theme.pine}"}
    broken_symlink: {foreground: "${theme.love}"}
    broken_path_overlay: {foreground: "${theme.highlightHigh}"}
''
