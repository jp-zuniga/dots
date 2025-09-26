{
  config,
  pkgs,
  theme,
  ...
}: {
  AllowFileSelectionDialogs = true;
  AppAutoUpdate = false;
  AutofillAddressEnabled = false;
  AutofillCreditCardEnabled = false;
  BackgroundAppUpdate = false;
  BlockAboutAddons = false;
  BlockAboutConfig = false;
  BlockAboutProfiles = false;
  BlockAboutSupport = false;
  DefaultDownloadDirectory = "${config.users.users.jaq.home}/dwnlds";
  DisableAppUpdate = true;
  DisableFirefoxAccounts = false;
  DisableFirefoxScreenshots = true;
  DisableFirefoxStudies = true;
  DisableFormHistory = true;
  DisableMasterPasswordCreation = true;
  DisablePocket = true;
  DisablePrivateBrowsing = false;
  DisableProfileImport = true;
  DisableProfileRefresh = false;
  DisableSafeMode = false;
  DisableSetDesktopBackground = true;
  DisableTelemetry = true;
  DisplayBookmarksToolbar = "never";
  DisplayMenuBar = "never";
  DNSOverHTTPS = {
    Enabled = true;
  };

  DontCheckDefaultBrowser = true;
  EnableTrackingProtection = {
    Cryptomining = true;
    Fingerprinting = true;
    Locked = true;
    Value = true;
  };

  EncryptedMediaExtensions = {
    Enabled = true;
  };

  ExtensionSettings = {
    "*" = {
      blocked_install_message = "Extensions must be added in NixOS configuration.";
      installation_mode = "blocked";
    };

    # "FirefoxColor@mozilla.com" = {
    #   # firefox color
    #   default_area = "menupanel";
    #   installation_mode = "force_installed";
    #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefox-color/latest.xpi";
    #   private_browsing = true;
    # };

    "jid1-MnnxcxisBPnSXQ@jetpack" = {
      # privacy badger
      default_area = "menupanel";
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
      private_browsing = true;
    };

    # "{20fc2e06-e3e4-4b2b-812b-ab431220cada}" = {
    #   # startpage
    #   default_area = "menupanel";
    #   installation_mode = "force_installed";
    #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/startpage-private-search/latest.xpi";
    #   private_browsing = true;
    # };

    "uBlock0@raymondhill.net" = {
      # ublock origin
      default_area = "menupanel";
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
      private_browsing = true;
    };
  };

  ExtensionUpdate = true;
  FirefoxHome = {
    Highlights = false;
    Locked = false;
    Pocket = false;
    Search = false;
    Snippets = false;
    SponsoredPocket = false;
    SponsoredTopSites = false;
    TopSites = false;
  };

  FirefoxSuggest = {
    WebSuggestions = false;
    SponsoredSuggestions = false;
    ImproveSuggest = false;
    Locked = false;
  };

  HardwareAcceleration = true;
  ManualAppUpdateOnly = true;
  NoDefaultBookmarks = false;
  OfferToSaveLogins = true;
  PasswordManagerEnabled = true;
  PictureInPicture = {
    Enabled = true;
  };

  PopupBlocking = {
    Allow = [];
    Default = true;
  };

  PromptForDownloadLocation = false;
  SearchSuggestEnabled = false;
  SanitizeOnShutdown = {
    Cache = true;
    History = true;
  };

  SearchEngines = import ./search-engines.nix pkgs;
  ShowHomeButton = false;
  SkipTermsOfUse = true;
  StartDownloadsInTempDirectory = true;
  UserMessaging = {
    ExtensionRecommendations = false;
    FirefoxLabs = false;
    FeatureRecommendations = false;
    MoreFromMozilla = false;
    SkipOnboarding = true;
    UrlbarInterventions = false;
    WhatsNew = false;
  };
}
