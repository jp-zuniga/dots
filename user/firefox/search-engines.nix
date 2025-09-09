{pkgs, ...}: let
  icon = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake-colours.svg";
in {
  Add = [
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
    {
      inherit icon;
      Alias = "@np";
      IconURL = icon;
      Name = "nixpkgs";
      URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
    }
    {
      inherit icon;
      Alias = "@no";
      IconURL = icon;
      Name = "nixopts";
      URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
    }
    {
      Alias = "@g";
      Name = "Gooogle";
      IconURL = "https://www.gstatic.com/marketing-cms/assets/images/d5/dc/cfe9ce8b4425b410b49b7f2dd3f3/g.webp=s48-fcrop64=1,00000000ffffffff-rw";
      URLTemplate = "https://www.google.com/search?q={searchTerms}";
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
