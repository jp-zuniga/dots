{
  Add = let
    nixIcon = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake-colours.svg";
  in [
    {
      Alias = "@c";
      IconURL = "https://crates.io/assets/cargo.png";
      Name = "crates.io";
      URLTemplate = "https://crates.io/search?q={searchTerms}";
    }
    # {
    #   Alias = "@drs";
    #   IconURL = "https://crates.io/assets/cargo.png";
    #   Name = "docs.rs";
    #   URLTemplate = "https://docs.rs/releases/search?query={searchTerms}";
    # }
    {
      Alias = "@ng";
      IconURL = nixIcon;
      Name = "noogle";
      URLTemplate = "https://noogle.dev/q?term={searchTerms}";
    }
    {
      Alias = "@np";
      IconURL = nixIcon;
      Name = "nixpkgs";
      URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
    }
    {
      Alias = "@no";
      IconURL = nixIcon;
      Name = "nixopts";
      URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
    }
    {
      Alias = "@g";
      Name = "Gooogle";
      IconURL = "https://www.gstatic.com/marketing-cms/assets/images/d5/dc/cfe9ce8b4425b410b49b7f2dd3f3/g.webp=s48-fcrop64=1,00000000ffffffff-rw";
      URLTemplate = "https://www.google.com/search?q={searchTerms}";
    }
    {
      Alias = "@sp";
      IconURL = "https://www.startpage.com/sp/cdn/favicons/favicon-gradient.ico";
      Name = "Startpage";
      URLTemplate = "https://www.startpage.com/sp/search?query={searchTerms}";
    }
    {
      Alias = "@wiki";
      IconURL = "https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia-logo.png";
      Name = "Wikipedia";
      URLTemplate = "https://wikipedia.org/wiki/Special:Search?search={searchTerms}";
    }
  ];

  Default = "Startpage";
  DefaultPrivate = "Startpage";
  PreventInstalls = true;
  Remove = [
    "Bing"
    "DuckDuckGo"
    "Google"
    "Wikipedia (en)"
  ];
}
