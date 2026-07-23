{ username, pkgs, lib, ... }:

{
  programs = {
    google-chrome = {
      enable = true;
    };
    firefox = {
      enable = true;

      languagePacks = [ "en-US" ];

      policies = {
        # Updates & Background Services
        AppAutoUpdate                 = false;
        BackgroundAppUpdate           = false;

        # Feature Disabling
        DisableBuiltinPDFViewer       = true;
        DisableFirefoxStudies         = true;
        DisableFirefoxAccounts        = true;
        DisableFirefoxScreenshots     = true;
        DisableForgetButton           = true;
        DisableMasterPasswordCreation = true;
        DisableProfileImport          = true;
        DisableProfileRefresh         = true;
        DisableSetDesktopBackground   = true;
        DisablePocket                 = true;
        DisableTelemetry              = true;
        DisableFormHistory            = true;
        DisablePasswordReveal         = true;

        # Access Restrictions
        BlockAboutConfig              = false;
        BlockAboutProfiles            = true;
        BlockAboutSupport             = true;

        # UI and Behavior
        DisplayMenuBar                = "never";
        DontCheckDefaultBrowser       = true;
        HardwareAcceleration          = false;
        OfferToSaveLogins             = false;
        DefaultDownloadDirectory      = "/home/${username}/Downloads";
        
      };

      profiles.default.search = {
        force           = true;
        default         = "DuckDuckGo";
        privateDefault  = "DuckDuckGo";
      };
    };
  };
}