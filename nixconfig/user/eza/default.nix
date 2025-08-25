{
  config,
  pkgs,
  theme,
  ...
}: let
  themeLocation = ${config.users.users.jaq.home}/.config/eza
  ezaTheme = pkgs.writeText "theme.yml" ''
    colourful: true
    filekinds:
      normal: {foreground: "${theme.text}"}
      directory: {foreground: "${theme.regular.blue}"}
      symlink: {foreground: "${theme.base0F}"}
      pipe: {foreground: "${theme.base04}"}
      block_device: {foreground: "${theme.regular.cyan}"}
      char_device: {foreground: "${theme.regular.yellow}"}
      socket: {foreground: "${theme.regular.background}"}
      special: {foreground: "${theme.accent}"}
      executable: {foreground: "${theme.accent}"}
      mount_point: {foreground: "${theme.base0E}"}
    perms:
      user_read: {foreground: "${theme.base04}"}
      user_write: {foreground: "${theme.base0E}"}
      user_execute_file: {foreground: "${theme.accent}"}
      user_execute_other: {foreground: "${theme.accent}"}
      group_read: {foreground: "${theme.base04}"}
      group_write: {foreground: "${theme.base0E}"}
      group_execute: {foreground: "${theme.accent}"}
      other_read: {foreground: "${theme.base04}"}
      other_write: {foreground: "${theme.base0E}"}
      other_execute: {foreground: "${theme.accent}"}
      special_user_file: {foreground: "${theme.accent}"}
      special_other: {foreground: "${theme.base0E}"}
      attribute: {foreground: "${theme.base04}"}
    size:
      major: {foreground: "${theme.base04}"}
      minor: {foreground: "${theme.regular.blue}"}
      number_byte: {foreground: "${theme.base04}"}
      number_kilo: {foreground: "${theme.base0F}"}
      number_mega: {foreground: "${theme.regular.green}"}
      number_giga: {foreground: "${theme.accent}"}
      number_huge: {foreground: "${theme.accent}"}
      unit_byte: {foreground: "${theme.base04}"}
      unit_kilo: {foreground: "${theme.regular.green}"}
      unit_mega: {foreground: "${theme.accent}"}
      unit_giga: {foreground: "${theme.accent}"}
      unit_huge: {foreground: "${theme.regular.blue}"}
    users:
      user_you: {foreground: "${theme.regular.yellow}"}
      user_root: {foreground: "${theme.regular.red}"}
      user_other: {foreground: "${theme.accent}"}
      group_yours: {foreground: "${theme.base0F}"}
      group_other: {foreground: "${theme.base03}"}
      group_root: {foreground: "${theme.regular.red}"}
    links:
      normal: {foreground: "${theme.regular.blue}"}
      multi_link_file: {foreground: "${theme.regular.green}"}
    git:
      new: {foreground: "${theme.regular.blue}"}
      modified: {foreground: "${theme.regular.yellow}"}
      deleted: {foreground: "${theme.regular.red}"}
      renamed: {foreground: "${theme.regular.green}"}
      typechange: {foreground: "${theme.accent}"}
      ignored: {foreground: "${theme.base03}"}
      conflicted: {foreground: "${theme.regular.cyan}"}
    git_repo:
      branch_main: {foreground: "${theme.base04}"}
      branch_other: {foreground: "${theme.accent}"}
      git_clean: {foreground: "${theme.regular.blue}"}
      git_dirty: {foreground: "${theme.regular.red}"}
    security_context:
      colon: {foreground: "${theme.base04}"}
      user: {foreground: "${theme.regular.blue}"}
      role: {foreground: "${theme.accent}"}
      typ: {foreground: "${theme.base03}"}
      range: {foreground: "${theme.accent}"}
    file_type:
      image: {foreground: "${theme.regular.yellow}"}
      video: {foreground: "${theme.regular.red}"}
      music: {foreground: "${theme.regular.blue}"}
      lossless: {foreground: "${theme.base03}"}
      crypto: {foreground: "${theme.base0E}"}
      document: {foreground: "${theme.base04}"}
      compressed: {foreground: "${theme.accent}"}
      temp: {foreground: "${theme.regular.cyan}"}
      compiled: {foreground: "${theme.regular.green}"}
      build: {foreground: "${theme.base03}"}
      source: {foreground: "${theme.regular.cyan}"}
      punctuation: {foreground: "${theme.base0D}"}
      date: {foreground: "${theme.regular.green}"}
      inode: {foreground: "${theme.base04}"}
      blocks: {foreground: "${theme.base0F}"}
      header: {foreground: "${theme.base04}"}
      octal: {foreground: "${theme.regular.blue}"}
      flags: {foreground: "${theme.accent}"}
      symlink_path: {foreground: "${theme.regular.blue}"}
      control_char: {foreground: "${theme.regular.green}"}
      broken_symlink: {foreground: "${theme.regular.red}"}
      broken_path_overlay: {foreground: "${theme.base0F}"}
  '';
in {
  environment.systemPackages = [pkgs.eza];
  system.activationScripts.ezaSetup = ''
    mkdir -p ${themeLocation}
    cp -f ${ezaTheme} ${themeLocation}
  '';
}
