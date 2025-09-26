{theme, ...}: {
  programs.starship = {
    enable = true;
    settings = {
      format = "[ ](fg:overlay)$directory[ ](fg:overlay)$git_branch$git_status$character";
      right_format = "$time";

      palette = "rose-pine";
      palettes = {
        rose-pine = {
          foam = theme.foam;
          gold = theme.gold;
          iris = theme.iris;
          love = theme.love;
          overlay = theme.overlay;
          pine = theme.pine;
          rose = theme.rose;
        };
      };

      character = {
        error_symbol = "[■](bold fg:love)";
        format = "$symbol ";
        success_symbol = "[●](bold fg:iris)";
      };

      directory = {
        format = "[ $path ]($style)";
        style = "bg:overlay fg:pine";
        truncation_length = 4;
        truncation_symbol = ".../";
      };

      git_branch = {
        format = "[](fg:overlay)[ $symbol $branch ]($style)[ ](fg:overlay)";
        style = "bold bg:overlay fg:foam";
        symbol = "";
      };

      git_status = {
        ahead = "[ \\($count\\)](bold bg:overlay fg:foam)";
        behind = "[ \\($count\\)](bold bg:overlay fg:rose)";
        deleted = "[×\\($count\\) ](bold bg:overlay fg:love)";
        disabled = false;
        diverged = "[\\[](bold bg:overlay fg:iris)[ \\($ahead_count\\)](bold bg:overlay fg:foam)[  \\($behind_count\\)](bold bg:overlay fg:rose)[\\]](bold bg:overlay fg:iris)";
        format = "[](fg:overlay)([$all_status$ahead_behind]($style))[ ](fg:overlay)";
        modified = "[!\\($count\\) ](bold bg:overlay fg:rose)";
        renamed = "[ \\($count\\) ](bold bg:overlay fg:iris)";
        staged = "[+\\($count\\) ](bold bg:overlay fg:pine)";
        stashed = "[\\$ ](bold bg:overlay fg:iris)";
        style = "bold bg:overlay fg:love";
        untracked = "[?\\($count\\) ](bold bg:overlay fg:gold)";
        up_to_date = "[✔](bg:overlay fg:iris)";
      };

      os = {
        disabled = false;
        style = "bg:overlay fg:iris";
      };

      time = {
        disabled = false;
        format = "[](fg:overlay)[ $time ]($style)[ ](fg:overlay)";
        style = "bold bg:overlay fg:rose";
        time_format = "%I:%M%P";
        use_12hr = true;
      };

      username = {
        disabled = false;
        format = "[ $user ]($style)";
        show_always = true;
        style_root = "bg:overlay fg:love";
        style_user = "bg:overlay fg:iris";
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
        Alpine = "  ";
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
  };
}
