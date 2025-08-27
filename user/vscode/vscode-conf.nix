{pkgs, ...}: let
  settings = {
    "[nix]" = {
      editor.defaultFormatter = "kamadorueda.alejandra";
      editor.formatOnPaste = false;
      editor.formatOnSave = true;
      editor.formatOnType = false;
      editor.tabSize = 2;
    };

    "[python]" = {
      editor.defaultFormatter = "charliermarsh.ruff";
      editor.formatOnSave = true;
    };

    accessibility.hideAccessibleView = true;
    accessibility.underlineLinks = true;
    alejandra.program = "alejandra";

    "better-comments.tags" = [
      {
        backgroundColor = "transparent";
        bold = true;
        color = "#98C379";
        italic = true;
        strikethrough = false;
        tag = "*";
        underline = false;
      }
      {
        backgroundColor = "transparent";
        bold = true;
        color = "#FF2D00";
        italic = false;
        strikethrough = false;
        tag = "!";
        underline = false;
      }
      {
        backgroundColor = "transparent";
        bold = false;
        color = "#3498DB";
        italic = true;
        strikethrough = false;
        tag = "?";
        underline = false;
      }
      {
        backgroundColor = "transparent";
        bold = true;
        color = "#FF8C00";
        italic = false;
        strikethrough = false;
        tag = "todo";
        underline = false;
      }
      {
        backgroundColor = "transparent";
        bold = false;
        color = "#474747";
        italic = false;
        strikethrough = true;
        tag = "//";
        underline = false;
      }
    ];

    betterAlign.indentBase = "dontchange";
    betterAlign.operatorPadding = "left";

    betterAlign.surroundSpace = {
      arrow = [1 1];
      assignment = [1 1];
      colon = [(-1) 1];
      comment = 2;
    };

    chat.agent.enabled = false;
    chat.agent.maxRequests = 0;
    chat.commandCenter.enabled = false;
    chat.detectParticipant.enabled = false;
    chat.useFileStorage = false;
    clangd.inactiveRegions.opacity = 0.6;
    codesnap.containerPadding = "0";
    codesnap.realLineNumbers = true;
    codesnap.roundedCorners = false;
    codesnap.showWindowControls = false;
    codesnap.target = "window";
    codesnap.transparentBackground = true;
    editor.accessibilitySupport = "off";
    editor.fontFamily = "JetBrainsMono Nerd Font Mono";
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

    files.associations = {
      "*.lock" = "json";
    };

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

    python = {
      analysis = {
        autoFormatStrings = true;
        autoImportCompletions = true;
        diagnosticMode = "openFilesOnly";
        enablePytestSupport = false;
        generateWithTypeAnnotation = true;
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
      defaultInterpreterPath = "/bin/python3";
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

    rust-analyzer = {
      diagnostics.enable = false;
      inlayHints = {
        chainingHints.enable = false;
        renderColons = false;
        typeHints = {
          enable = false;
          hideClosureInitialization = true;
          hideClosureParameter = true;
          hideNamedConstructor = true;
        };
      };
      lens.enable = false;
      restartServerOnConfigChange = true;
      showDependenciesExplorer = false;
    };

    security.workspace.trust.untrustedFiles = "newWindow";
    telemetry.feedback.enabled = false;
    telemetry.telemetryLevel = "off";

    terminal.integrated = {
      cursorBlinking = true;
      defaultProfile.linux = "fish";
      fontFamily = "JetBrainsMono Nerd Font Mono";
      fontLigatures.enabled = true;
      profiles.linux = {
        bash = null;
        "JavaScript Debug Terminal" = null;
      };
      profiles.windows = {
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
      title = " ";
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
