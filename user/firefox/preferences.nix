let
  lockFalse = {
    Value = false;
    Status = "locked";
  };

  lockTrue = {
    Value = true;
    Status = "locked";
  };
in {
  "app.normandy.api_url" = "";
  "app.normandy.enabled" = lockFalse;
  "app.shield.optoutstudies.enabled" = lockFalse;
  "app.update.auto" = false;
  "breakpad.reportURL" = "";
  "browser.aboutConfig.showWarning" = lockFalse;
  "browser.aboutwelcome.enabled" = lockFalse;
  "browser.bookmarks.defaultLocation" = "r31SjExHw-QB";
  "browser.bookmarks.restore_default_bookmarks" = false;
  "browser.contentblocking.category" = {
    Status = "locked";
    Value = "strict";
  };

  "browser.ctrlTab.recentlyUsedOrder" = false;
  "browser.crashReports.unsubmittedCheck.autoSubmit2" = lockFalse;
  "browser.discovery.enabled" = false;
  "browser.formfill.enable" = true;
  "browser.laterrun.enabled" = false;
  "browser.newtab.url" = "about:blank";
  "browser.newtabpage.activity-stream.enabled" = lockFalse;
  "browser.newtabpage.activity-stream.feeds.section.topstories" = lockFalse;
  "browser.newtabpage.activity-stream.feeds.snippets" = false;
  "browser.newtabpage.activity-stream.feeds.topsites" = lockFalse;
  "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;
  "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "";
  "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = "";
  "browser.newtabpage.activity-stream.showSponsored" = lockFalse;
  "browser.newtabpage.activity-stream.showSponsoredTopSites" = lockFalse;
  "browser.newtabpage.activity-stream.telemetry" = lockFalse;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
  "browser.newtabpage.activity-stream.section.highlights.includePocket" = lockFalse;
  "browser.newtabpage.enhanced" = lockFalse;
  "browser.newtabpage.introShown" = lockTrue;
  "browser.newtabpage.pinned" = false;
  "browser.ping-centre.telemetry" = lockFalse;
  "browser.privatebrowsing.forceMediaMemoryCache" = lockTrue;
  "browser.protections_panel.infoMessage.seen" = lockTrue;
  "browser.search.suggest.enabled" = lockFalse;
  "browser.search.suggest.enabled.private" = lockFalse;
  "browser.search.update" = false;
  "browser.shell.checkDefaultBrowser" = lockFalse;
  "browser.ssb.enabled" = true;
  "browser.startup.homepage" = "";
  "browser.startup.homepage_override.mstone" = "ignore";
  "browser.startup.page" = 3;
  "browser.tabs.crashReporting.sendReport" = lockFalse;
  "browser.tabs.delayHidingAudioPlayingIconMS" = 0;
  "browser.tabs.firefox-view" = lockFalse;
  "browser.toolbars.bookmarks.visibility" = "newtab";
  "browser.uiCustomization.state" = builtins.toJSON {
    currentVersion = 20;
    newElementCount = 7;
    placements = {
      PersonalToolbar = ["personal-bookmarks"];
      TabsToolbar = [
        "tabbrowser-tabs"
        "new-tab-button"
      ];

      nav-bar = [
        "managed-bookmarks"
        "urlbar-container"
        "downloads-button"
        "unified-extensions-button"
      ];

      toolbar-menubar = [];
      widget-overflow-fixed-list = [];
    };
  };

  "browser.urlbar.placeholderName" = "";
  "browser.urlbar.suggest.openpage" = lockFalse;
  "browser.urlbar.suggest.recentsearches" = lockFalse;
  "browser.urlbar.suggest.topsites" = lockFalse;
  "datareporting.healthreport.service.enabled" = lockFalse;
  "datareporting.healthreport.uploadEnabled" = lockFalse;
  "datareporting.policy.dataSubmissionEnable" = false;
  "datareporting.policy.dataSubmissionEnabled" = lockFalse;
  "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
  "dom.block_multiple_popups" = lockTrue;
  "dom.security.https_only_mode" = lockTrue;
  "dom.security.https_only_mode_ever_enabled" = lockTrue;
  "dom.webnotifications.enabled" = lockFalse;
  "dom.webnotifications.serviceworker.enabled" = lockFalse;
  "experiments.enabled" = lockFalse;
  "experiments.manifest.uri" = "";
  "experiments.supported" = lockFalse;
  "extensions.allowPrivateBrowsingByDefault" = lockTrue;
  "extensions.autoDisableScopes" = {
    Status = "locked";
    Value = 0;
  };

  "extensions.enabledScopes" = {
    Status = "locked";
    Value = 15;
  };

  "extensions.firefoxalpenglow.enabled" = lockFalse;
  "extensions.formautofill.addresses.enabled" = lockFalse;
  "extensions.formautofill.available" = "off";
  "extensions.formautofill.creditCards.available" = lockFalse;
  "extensions.formautofill.creditCards.enabled" = lockFalse;
  "extensions.formautofill.heuristics.enabled" = lockFalse;
  "extensions.getAddons.cache.enabled" = lockFalse;
  "extensions.getAddons.showPane" = lockFalse;
  "extensions.htmlaboutaddons.recommendations.enabled" = lockFalse;
  "extensions.light.enabled" = lockFalse;
  "extensions.screenshots.disabled" = lockTrue;
  "extensions.systemthemeauto.enabled" = lockFalse;
  "extensions.ui.locale.hidden" = lockTrue;
  "extensions.ui.sitepermission.hidden" = lockTrue;
  "extensions.update.enabled" = false;
  "extensions.webextensions.restrictedDomains" = {
    Status = "locked";
    Value = "";
  };

  "extensions.webcompat.enable_picture_in_picture_overrides" = true;
  "extensions.webcompat.enable_shims" = true;
  "extensions.webcompat.perform_injections" = true;
  "extensions.webcompat.perform_ua_overrides" = true;
  "general.smoothScroll" = true;
  "general.smoothScroll.lines.durationMaxMS" = 125;
  "general.smoothScroll.lines.durationMinMS" = 125;
  "general.smoothScroll.msdPhysics.enabled" = true;
  "general.smoothScroll.mouseWheel.durationMaxMS" = 200;
  "general.smoothScroll.mouseWheel.durationMinMS" = 100;
  "general.smoothScroll.other.durationMaxMS" = 125;
  "general.smoothScroll.other.durationMinMS" = 125;
  "general.smoothScroll.pages.durationMaxMS" = 125;
  "general.smoothScroll.pages.durationMinMS" = 125;
  "layout.css.backdrop-filter.enabled" = true;
  "layout.css.color-mix.enabled" = true;
  "layout.word_select.eat_space_to_next_word" = lockFalse;
  "media.ffmpeg.vaapi.enabled" = true;
  "mousewheel.min_line_scroll_amount" = 30;
  "mousewheel.system_scroll_override_on_root_content.enabled" = true;
  "mousewheel.system_scroll_override_on_root_content.horizontal.factor" = 175;
  "mousewheel.system_scroll_override_on_root_content.vertical.factor" = 175;
  "network.trr.custom_uri" = "https://dns.quad9.net/dns-query";
  "network.trr.mode" = 3;
  "network.trr.uri" = "https://dns.quad9.net/dns-query";
  "permissions.default.camera" = 2;
  "permissions.default.desktop-notification" = 2;
  "permissions.default.geo" = 2;
  "permissions.default.microphone" = 2;
  "permissions.default.xr" = 2;
  "plugin.state.flash" = 0;
  "plugins.enumerable_names" = "";
  "privacy.clearOnShutdown.cache" = lockTrue;
  "privacy.clearOnShutdown.cookies" = false;
  "privacy.clearOnShutdown.downloads" = lockTrue;
  "privacy.clearOnShutdown.formdata" = lockTrue;
  "privacy.clearOnShutdown.history" = lockTrue;
  "privacy.clearOnShutdown.offlineApps" = lockTrue;
  "privacy.clearOnShutdown.sessions" = lockTrue;
  "privacy.clearOnShutdown.siteSettings" = lockTrue;
  "privacy.donottrackheader.enabled" = lockTrue;
  "privacy.donottrackheader.value" = 1;
  "privacy.globalprivacycontrol.enabled" = lockTrue;
  "privacy.globalprivacycontrol.functionality.enabled" = lockTrue;
  "privacy.popups.disable_from_plugins" = 3;
  "privacy.purge_trackers.enabled" = lockTrue;
  "privacy.query_stripping.enabled" = lockTrue;
  "privacy.query_stripping.enabled.pbmode" = lockTrue;
  "privacy.resistFingerprinting" = lockTrue;
  "privacy.sanitize.sanitizeOnShutdown" = lockTrue;
  "privacy.trackingprotection.cryptomining.enabled" = lockTrue;
  "privacy.trackingprotection.enabled" = lockTrue;
  "privacy.trackingprotection.fingerprinting.enabled" = lockTrue;
  "privacy.trackingprotection.socialtracking.enabled" = lockTrue;
  "privacy.userContext.enabled" = true;
  "privacy.userContext.longPressBehavior" = 2;
  "privacy.userContext.ui.enabled" = true;
  "reader.parse-on-load.force-enabled" = true;
  "signon.rememberSignons" = lockFalse;
  "svg.context-properties.content.enabled" = true;
  "toolkit.coverage.endpoint.base" = "";
  "toolkit.coverage.opt-out" = lockTrue;
  "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  "toolkit.scrollbox.horizontalScrollDistance" = 6;
  "toolkit.scrollbox.verticalScrollDistance" = 2;
  "toolkit.telemetry.archive.enabled" = lockFalse;
  "toolkit.telemetry.bhrPing.enabled" = lockFalse;
  "toolkit.telemetry.coverage.opt-out" = lockTrue;
  "toolkit.telemetry.enabled" = lockFalse;
  "toolkit.telemetry.firstShutdownPing.enabled" = lockFalse;
  "toolkit.telemetry.newProfilePing.enabled" = lockFalse;
  "toolkit.telemetry.server" = "data:,";
  "toolkit.telemetry.shutdownPingSender.enabled" = lockFalse;
  "toolkit.telemetry.unified" = lockFalse;
  "toolkit.telemetry.updatePing.enabled" = lockFalse;
  "trailhead.firstrun.didSeeAboutWelcome" = lockTrue;
}
