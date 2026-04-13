{
  pkgs,
  theme,
  ...
}: let
  # @ts: { formatter: string; tabs: number; fmtOnPaste: boolean; fmtOnSave: boolean; fmtOnType: boolean}
  mkEditor = {
    formatter,
    fmtOnPaste ? false,
    fmtOnSave ? true,
    fmtOnType ? false,
    tabs ? 2,
  }: {
    editor = {
      defaultFormatter = formatter;
      formatOnPaste = fmtOnPaste;
      formatOnSave = fmtOnSave;
      formatOnType = fmtOnType;
      tabSize = tabs;
    };
  };

  settings = let
    c-cpp = mkEditor {formatter = "llvm-vs-code-extensions.vscode-clangd";};
    prettier = mkEditor {formatter = "esbenp.prettier-vscode";};
  in {
    "[c]" = c-cpp;
    "[cpp]" = c-cpp;

    "[css]" = prettier;
    "[html]" = prettier;
    "[javascript]" = prettier;
    "[json]" = prettier;
    "[jsonc]" = prettier;
    "[markdown]" = prettier;

    "[nix]" = mkEditor {formatter = "kamadorueda.alejandra";};
    "[shellscript]" = mkEditor {formatter = "mkhl.shfmt";};
    "[toml]" = mkEditor {formatter = "tamasfe.even-better-toml";};
    "[just]" = mkEditor {
      formatter = "nefrob.vscode-just-syntax";
      tabs = 4;
    };

    "[python]" = mkEditor {
      formatter = "charliermarsh.ruff";
      tabs = 4;
    };

    "[rust]" = mkEditor {
      formatter = "rust-lang.rust-analyzer";
      tabs = 4;
    };

    accessibility = {
      hideAccessibleView = true;
      underlineLinks = true;
    };

    alejandra.program = "alejandra";
    catppuccin = {
      extraBordersEnabled = true;
      syncWithIconPack = false;
    };

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

      mouseWheelZoom = false;
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
    nix = {
      enableLanguageServer = true;
      serverPath = "nil";
      serverSettings.nil.formatting.command = ["alejandra"];
    };

    python = {
      activateStateToolPath = "";
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

      terminal = {
        activateEnvironment = false;
        shellIntegration.enabled = false;
      };

      testing = {
        autoTestDiscoverOnSaveEnabled = false;
        promptToConfigure = false;
        pytestPath = "";
        unittestArgs = [];
      };
    };

    ruff = {
      codeAction.disableRuleComment.enable = false;
      configurationPreference = "filesystemFirst";
      format.preview = true;
      lint.preview = true;
      nativeServer = "on";
    };

    rust-analyzer = {
      assist.preferSelf = true;
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
      importStrategy = "useBundled";
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

      colorTheme = theme.fancy;
      commandPalette.experimental.enableNaturalLanguageSearch = false;
      editor = {
        editorActionsLocation = "hidden";
        empty.hint = "hidden";
      };

      enableExperiments = false;
      iconTheme = theme.kebabName;
      layoutControl.enabled = false;
      navigationControl.enabled = false;
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
