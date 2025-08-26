{pkgs, ...}: let
  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
in {
  Add = [
    {
      Alias = "sp";
      IconURL = "https://www.startpage.com/sp/cdn/favicons/favicon-gradient.ico";
      Name = "Startpage";
      URLTemplate = "https://www.startpage.com/sp/search?query={searchTerms}";
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
  ];

  Default = "Startpage";
  PreventInstalls = true;
  Remove = [
    "Actions"
    "Bing"
    "DuckDuckGo"
    "History"
    "Tabs"
  ];
}
