{pkgs, ...}: let
  settings = let
    fmtOptions = {
      formatOnPaste = false;
      formatOnSave = true;
      formatOnType = false;
      tabSize = 2;
    };

    prettier = "esbenp.prettier-vscode";
  in {
    "[c]".editor = {
      inherit fmtOptions;
      defaultFormatter = "llvm-vs-code-extensions.vscode-clangd";
    };

    "[cpp]".editor = {
      inherit fmtOptions;
      defaultFormatter = "llvm-vs-code-extensions.vscode-clangd";
    };

    "[css]".editor = {
      inherit fmtOptions;
      defaultFormatter = prettier;
    };

    "[html]".editor = {
      inherit fmtOptions;
      defaultFormatter = prettier;
    };

    "[json]".editor = {
      inherit fmtOptions;
      defaultFormatter = prettier;
    };

    "[jsonc]".editor = {
      inherit fmtOptions;
      defaultFormatter = prettier;
    };

    "[just]".editor = {
      inherit fmtOptions;
      defaultFormatter = "nefrob.vscode-just-syntax";
      tabSize = 4;
    };

    "[markdown]".editor = {
      inherit fmtOptions;
      defaultFormatter = prettier;
    };

    "[nix]".editor = {
      inherit fmtOptions;
      defaultFormatter = "kamadorueda.alejandra";
    };

    "[python]".editor = {
      inherit fmtOptions;
      defaultFormatter = "charliermarsh.ruff";
      tabSize = 4;
    };

    "[rust]".editor = {
      inherit fmtOptions;
      defaultFormatter = "rust-lang.rust-analyzer";
      tabSize = 4;
    };

    "[shellscript]".editor = {
      inherit fmtOptions;
      defaultFormatter = "mads-hartmann.bash-ide-vscode";
    };

    "[toml]".editor = {
      inherit fmtOptions;
      defaultFormatter = "tamasfe.even-better-toml";
    };

    accessibility = {
      hideAccessibleView = true;
      underlineLinks = true;
    };

    alejandra.program = "alejandra";
    chat.disableAIFeatures = true;
    clangd = {
      arguments = ["--query-driver=/nix/store/**/*"];
      detectExtensionConflicts = false;
      enable = true;
      enableCodeCompletion = true;
      enableHover = true;
      fallbackFlags = ["-xc++"];
      inactiveRegions.opacity = 0.6;
      onConfigChanged = "restart";
    };

    editor = {
      accessibilitySupport = "off";
      fontFamily = "monospace";
      minimap = {
        maxColumn = 90;
        renderCharacters = false;
        size = "fit";
      };

      mouseWheelZoom = true;
    };

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

    explorer = {
      autoReveal = "focusNoScroll";
      confirmDelete = false;
      confirmDragAndDrop = false;
      confirmPasteNative = false;
    };

    extensions.ignoreRecommendations = true;
    files = {
      autoSave = "afterDelay";
      autoSaveDelay = 1000;

      exclude = {
        "**/.git" = false;
      };

      readonlyInclude = {
        "**/.cargo/git/checkouts/**/*.rs" = true;
        "**/.cargo/registry/src/**/*.rs" = true;
        "**/lib/rustlib/src/rust/library/**/*.rs" = true;
      };

      trimTrailingWhitespace = true;
    };

    git = {
      autofetch = true;
      confirmSync = false;
      enableSmartCommit = true;
      openRepositoryInParentFolders = "always";
    };

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
      defaultInterpreterPath = "\${workspaceFolder}/.venv/bin/python3";
      experiments.enabled = false;
      languageServer = "None";
      missingPackage.severity = "Warning";
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
      codeAction.disableRuleComment.enable = false;
      lint.preview = true;
      nativeServer = "on";
    };

    rust-analyzer = {
      diagnostics.enable = false;
      inlayHints = {
        chainingHints.enable = false;
        renderColons = false;
        typeHints = {
          enable = true;
          hideClosureInitialization = true;
          hideClosureParameter = true;
          hideNamedConstructor = true;
        };
      };

      lens.enable = false;
      restartServerOnConfigChange = true;
      showDependenciesExplorer = false;
    };

    scm.defaultViewMode = "tree";
    security.workspace.trust.untrustedFiles = "newWindow";
    telemetry = {
      feedback.enabled = false;
      telemetryLevel = "off";
    };

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

    ty = {
      diagnosticMode = "workspace";
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
      editor = {
        editorActionsLocation = "hidden";
        empty.hint = "hidden";
      };

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

    zenMode = {
      hideLineNumbers = false;
      showTabs = "none";
    };
  };
in
  pkgs.writeText "vscode-conf.json" (builtins.toJSON settings)
