{
  lib,
  pkgs,
  theme,
  ...
}: let
  policies = {
    "3rdparty".Extensions = {
      "uBlock0@raymondhill.net" = {
        adminSettings = {
          adminSettings = {
            selectedFilterLists = [
              "adguard-cookies"
              "adguard-generic"
              "adguard-mobile"
              "adguard-mobile-app-banners"
              "adguard-other-annoyances"
              "adguard-popup-overlays"
              "adguard-social"
              "adguard-spyware"
              "adguard-spyware-url"
              "adguard-widgets"
              "block-lan"
              "curben-phishing"
              "dpollock-0"
              "easylist"
              "easylist-annoyances"
              "easylist-chat"
              "easylist-newsletters"
              "easylist-notifications"
              "easyprivacy"
              "fanboy-cookiemonster"
              "fanboy-social"
              "fanboy-thirdparty_social"
              "plowe-0"
              "ublock-annoyances"
              "ublock-badware"
              "ublock-cookies-adguard"
              "ublock-cookies-easylist"
              "ublock-filters"
              "ublock-privacy"
              "ublock-quick-fixes"
              "ublock-unbreak"
              "urlhaus-1"
              "user-filters"
            ];

            userSettings = {
              advancedUserEnabled = true;
              cloudStorageEnabled = lib.mkForce false;
              popupPanelSections = 31;
              uiAccentCustom = true;
              uiAccentCustom0 = theme.iris;
              uiTheme = "dark";
              userFiltersTrusted = true;
            };
          };
        };

        default_area = "mennupanel";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        installation_mode = "force_installed";
        private_browsing = true;
      };
    };

    AllowFileSelectionDialogs = true;
    AppAutoUpdate = false;
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    BackgroundAppUpdate = false;
    BlockAboutAddons = false;
    BlockAboutConfig = false;
    BlockAboutProfiles = false;
    BlockAboutSupport = false;
    DefaultDownloadDirectory = "~/dwnlds";
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

      "jid1-MnnxcxisBPnSXQ@jetpack" = {
        # privacy badger
        default_area = "menupanel";
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
        private_browsing = true;
      };

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

    Preferences = {
      "browser.tabs.warnOnClose" = {
        Value = false;
      };
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
  };
in
  pkgs.writeText "policies.json" (builtins.toJSON policies)
