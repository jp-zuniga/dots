{pkgs, ...}: let
  settings = {
    "[cpp]" = {
      editor.defaultFormatter = "llvm-vs-code-extensions.vscode-clangd";
      editor.formatOnPaste = false;
      editor.formatOnSave = true;
      editor.formatOnType = false;
      editor.tabSize = 2;
    };

    "[nix]" = {
      editor.defaultFormatter = "kamadorueda.alejandra";
      editor.formatOnPaste = false;
      editor.formatOnSave = true;
      editor.formatOnType = false;
      editor.tabSize = 2;
    };

    "[python]" = {
      editor.defaultFormatter = "charliermarsh.ruff";
      editor.formatOnPaste = false;
      editor.formatOnSave = true;
      editor.formatOnType = false;
      editor.tabSize = 4;
    };

    "[shellscript]" = {
      editor.defaultFormatter = "foxundermoon.shell-format";
      editor.formatOnPaste = false;
      editor.formatOnSave = true;
      editor.formatOnType = false;
      editor.tabSize = 2;
    };

    accessibility.hideAccessibleView = true;
    accessibility.underlineLinks = true;
    alejandra.program = "alejandra";
    chat.disableAIFeatures = true;
    clangd = {
      enable = true;
      enableCodeCompletion = true;
      enableHover = true;
      inactiveRegions.opacity = 0.6;
    };

    editor.accessibilitySupport = "off";
    editor.fontFamily = "monospace";
    editor.minimap.maxColumn = 90;
    editor.minimap.renderCharacters = false;
    editor.minimap.size = "fit";
    editor.mouseWheelZoom = true;

    evenBetterToml = {
      completion.maxKeys = 3;
      formatter = {
        alignComments = true;
        alignEntries = true;
        allowedBlankLines = 1;
        arrayAutoCollapse = false;
        arrayTrailingComma = true;
        columnWidth = 80;
        indentEntries = true;
        indentTables = true;
        inlineTableExpand = true;
        reorderArrays = true;
        reorderInlineTables = true;
        reorderKeys = true;
        trailingNewline = true;
      };

      schema.links = true;
      semanticTokens = true;
      taplo.configFile.enabled = false;
    };

    explorer.autoReveal = "focusNoScroll";
    explorer.confirmDelete = false;
    explorer.confirmDragAndDrop = false;
    explorer.confirmPasteNative = false;
    extensions.ignoreRecommendations = true;

    files.autoSave = "afterDelay";
    files.autoSaveDelay = 1000;

    files.exclude = {
      "**/.git" = false;
    };

    files.readonlyInclude = {
      "**/.cargo/git/checkouts/**/*.rs" = true;
      "**/.cargo/registry/src/**/*.rs" = true;
      "**/lib/rustlib/src/rust/library/**/*.rs" = true;
    };

    files.trimTrailingWhitespace = true;
    git.autofetch = true;
    git.confirmSync = false;
    git.enableSmartCommit = true;
    git.openRepositoryInParentFolders = "always";
    github.gitProtocol = "ssh";

    python = {
      analysis = {
        autoFormatStrings = true;
        autoImportCompletions = true;
        completeFunctionParens = true;
        diagnosticMode = "openFilesOnly";
        generateWithTypeAnnotation = true;
        inlayHints = {
          callArgumentNames = "all";
          functionReturnTypes = true;
          pytestParameters = true;
          variableTypes = true;
        };

        languageServerMode = "full";
        logLevel = "Error";
        typeCheckingMode = "standard";
        typeEvaluation = {
          deprecateTypingAliases = true;
          enableReachabilityAnalysis = true;
          strictDictionaryInference = true;
          strictListInference = true;
          strictSetInference = true;
        };
      };

      createEnvironment.trigger = "off";
      defaultInterpreterPath = "**/.venv/bin/python3";
      experiments.enabled = false;
      languageServer = "Pylance";
      pipenvPath = "";
      pixiToolPath = "";
      poetryPath = "";
      REPL = {
        enableREPLSmartSend = false;
        provideVariables = false;
      };

      terminal.activateEnvironment = false;
      testing = {
        autoTestDiscoverOnSaveEnabled = false;
        promptToConfigure = false;
        pytestPath = "";
      };
    };

    ruff = {
      codeAction.disableRuleComment = {
        enable = false;
      };

      nativeServer = "on";
    };

    # rust-analyzer = {
    #   diagnostics.enable = false;
    #   inlayHints = {
    #     chainingHints.enable = false;
    #     renderColons = false;
    #     typeHints = {
    #       enable = false;
    #       hideClosureInitialization = true;
    #       hideClosureParameter = true;
    #       hideNamedConstructor = true;
    #     };
    #   };

    #   lens.enable = false;
    #   restartServerOnConfigChange = true;
    #   showDependenciesExplorer = false;
    # };

    security.workspace.trust.untrustedFiles = "newWindow";
    telemetry.feedback.enabled = false;
    telemetry.telemetryLevel = "off";

    terminal.integrated = {
      cursorBlinking = true;
      defaultProfile.linux = "fish";
      fontFamily = "monospace";
      fontLigatures.enabled = false;
      profiles.linux = {
        bash = null;
        "JavaScript Debug Terminal" = null;
      };
    };

    update = {
      mode = "none";
      showReleaseNotes = false;
    };

    window = {
      commandCenter = false;
      customTitleBarVisibility = "windowed";
      enableMenuBarMnemonics = false;
      menuBarVisibility = "compact";
      newWindowDimensions = "maximized";
      restoreFullscreen = true;
      title = "";
      titleBarStyle = "custom";
    };

    workbench = {
      activityBar.location = "top";
      cloudChanges = {
        autoResume = "off";
        continueOn = "off";
      };

      colorTheme = "Rosé Pine Moon";
      commandPalette.experimental.enableNaturalLanguageSearch = false;
      editor.editorActionsLocation = "hidden";
      editor.empty.hint = "hidden";
      enableExperiments = false;
      iconTheme = "material-icon-theme";
      layoutControl.enabled = false;
      navigationControl.enabled = false;
      preferredDarkColorTheme = "Rosé Pine Moon";
      preferredLightColorTheme = "Rosé Pine Dawn";
      productIconTheme = "material-product-icons";
      settings.enableNaturalLanguageSearch = false;
      startupEditor = "none";
      tips.enabled = false;
    };

    zenMode.hideLineNumbers = false;
    zenMode.showTabs = "none";
  };
in
  pkgs.writeText "vscode-conf.json" (builtins.toJSON settings)
