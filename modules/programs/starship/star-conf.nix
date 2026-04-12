{
  flake,
  pkgs,
  theme,
  ...
}: let
  close = "[](fg:black)";
  open = "[](fg:black)";

  openDiverged = "[\\[](bold bg:black fg:magenta)";
  divergedAhead = "[ \\($ahead_count\\)](bold bg:black fg:blue)";
  divergedBehind = "[  \\($behind_count\\)](bold bg:black fg:cyan)";
  closeDiverged = "[\\]](bold bg:black fg:magenta)";

  settings = {
    format = "$directory$git_branch$git_status $character ";

    palette = "colors";
    palettes = {
      inherit (theme) colors;
    };

    character = {
      error_symbol = "[■](bold fg:red)";
      format = "$symbol";
      success_symbol = "[●](bold fg:magenta)";
    };

    directory = {
      format = "${open}[$path]($style)${close}";
      style = "bg:black fg:green";
      truncation_length = 3;
      truncation_symbol = ".../";
    };

    git_branch = {
      format = " ${open}[$symbol $branch]($style)${close}";
      style = "bold bg:black fg:blue";
      symbol = "󰊢";
    };

    git_status = {
      ahead = "[ \\($count\\)](bold bg:black fg:blue)";
      behind = "[ \\($count\\)](bold bg:black fg:cyan)";
      conflicted = "[= ](bold bg:black fg:red)";
      deleted = "[×\\($count\\) ](bold bg:black fg:red)";
      disabled = false;
      diverged = "${openDiverged}${divergedAhead}${divergedBehind}${closeDiverged}";
      format = " ${open}[$all_status$ahead_behind]($style)${close}";
      modified = "[!\\($count\\) ](bold bg:black fg:cyan)";
      renamed = "[ \\($count\\) ](bold bg:black fg:magenta)";
      staged = "[+\\($count\\) ](bold bg:black fg:green)";
      stashed = "[\\$ ](bold bg:black fg:magenta)";
      style = "bg:black";
      untracked = "[?\\($count\\)](bold bg:black fg:yellow) ";
      up_to_date = "[✔](bold bg:black fg:magenta)";
    };

    os = {
      disabled = true;
      style = "bg:black fg:magenta";
    };

    time = {
      disabled = true;
      format = "(fg:black)[ $time ]($style)(fg:black)";
      style = "bold bg:black fg:cyan";
      time_format = "%I:%M%P";
      use_12hr = true;
    };

    username = {
      disabled = true;
      format = "[ $user ]($style)";
      show_always = false;
      style_root = "bg:black fg:red";
      style_user = "bg:black fg:magenta";
    };

    aws.symbol = "  ";
    buf = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    bun = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    c = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    cpp = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    cmake = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    crystal = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    dart = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    deno = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    dotnet = {
      format = "[$symbol($version )]($style)";
      style = "bold fg:crust bg:green";
    };

    docker_context.symbol = "  ";
    elixir = {
      format = "[$symbol($version \\(OTP $otp_version\\) )]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    elm = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    fennel = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    fossil_branch.symbol = "  ";
    gcloud.symbol = "   ";
    git_commit.tag_symbol = "  ";
    gleam = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
    };

    golang = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    gradle.symbol = "  ";
    guix_shell.symbol = "  ";
    haskell = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    haxe.symbol = "  ";
    helm = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
    };

    hg_branch.symbol = "  ";
    hostname.ssh_symbol = "  ";
    java = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    julia = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    kotlin = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    lua = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    memory_usage.symbol = " 󰍛 ";
    meson.symbol = " 󰔷 ";
    nim = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = " 󰆥 ";
    };

    nix_shell.symbol = "  ";
    nodejs = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    ocaml = {
      format = "$symbol($version )(\\($switch_indicator$switch_name\\) )]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    package = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = " 󰏗 ";
    };

    perl = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    php = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    pijul_channel.symbol = "  ";
    pixi.symbol = " 󰏗 ";
    python = {
      format = "[$symbol$pyenv_prefix($version )(\\($virtualenv\\) )]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    quarto = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
    };

    raku = {
      format = "[$symbol($version-$vm_version )]($style)";
      style = "bold fg:crust bg:green";
    };

    rlang = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = " 󰟔 ";
    };

    ruby = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    rust = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = " 󱘗 ";
    };

    scala = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    swift = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    typst = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
    };

    vagrant = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
    };

    vlang = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
    };

    zig = {
      format = "[$symbol$version ]($style)";
      style = "bold fg:crust bg:green";
      symbol = "  ";
    };

    os.symbols = {
      AlmaLinux = "  ";
      Alpaquita = "  ";
      Algreen = "  ";
      Amazon = "  ";
      Android = "  ";
      Arch = "  ";
      Artix = "  ";
      CachyOS = "  ";
      CentOS = "  ";
      Debian = "  ";
      DragonFly = "  ";
      Emscripten = "  ";
      EndeavourOS = "  ";
      Fedora = "  ";
      FreeBSD = "  ";
      Garuda = " 󰛓 ";
      Gentoo = " 󰣨 ";
      HardenedBSD = " 󰞌 ";
      Illumos = " 󰈸 ";
      Kali = "  ";
      Linux = "  ";
      Mabox = "  ";
      Macos = "  ";
      Manjaro = "  ";
      Mariner = "  ";
      MidnightBSD = "  ";
      Mint = " 󰣭 ";
      NetBSD = "  ";
      NixOS = "  ";
      Nobara = "  ";
      OpenBSD = " 󰈺 ";
      OracleLinux = " 󰌷 ";
      Pop = "  ";
      Raspbian = "  ";
      RedHatEnterprise = "  ";
      Redhat = "  ";
      Redox = " 󰀘 ";
      RockyLinux = "  ";
      SUSE = "  ";
      Solus = " 󰠳 ";
      Ubuntu = "  ";
      Unknown = "  ";
      Void = "  ";
      Windows = " 󰍲 ";
      openSUSE = "  ";
    };
  };
in
  pkgs.writeText "starship.toml" (flake.lib.toTOML settings)
