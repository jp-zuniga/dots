{
  advice = {
    addEmptyPathspec = false;
    pushNonFastForward = false;
    statusHints = false;
  };

  branch = {
    sort = "-committerdate";
  };

  color = {
    branch = {
      current = "magenta";
      local = "default";
      plain = "blue";
      remote = "yellow";
      upstream = "green";
    };

    decorate = {
      HEAD = "blue";
      branch = "cyan";
      remoteBranch = "green";
      tag = "yellow";
    };
  };

  column = {
    ui = "auto";
  };

  commit = {
    gpgsign = true;
  };

  core = {
    compression = 9;
    editor = "code --wait";
    pager = "delta | $PAGER";
    preloadIndex = true;
    whitespace = "error";
  };

  diff = {
    colorMoved = "default";
    context = 3;
    interHunkContext = 8;
    renames = "copies";
  };

  delta = {
    dark = true;
    line-numbers = true;
    navigate = true;
  };

  gpg = {
    format = "ssh";
  };

  init = {
    defaultBranch = "main";
  };

  interactive = {
    diffFilter = "delta --color-only";
  };

  log = {
    graphColors = "blue,yellow,cyan,magenta,green,red";
  };

  merge = {
    conflictstyle = "diff3";
  };

  pull = {
    default = "current";
    rebase = true;
  };

  push = {
    autoSetupRemote = true;
    default = "current";
  };

  rebase = {
    autoStash = true;
    missingCommitsCheck = "warn";
  };

  rerere = {
    enabled = true;
  };

  status = {
    branch = true;
    showStash = true;
    showUntrackedFiles = "all";
  };

  tag = {
    sort = "-taggerdate";
  };

  user = {
    name = "jp-zuniga";
    email = "jp.zuniga.dev@gmail.com";
    signingKey = "/home/jaq/.ssh/id_ed25519.pub";
  };

  url = {
    "https://github.com/" = {
      insteadOf = "gh://";
    };
    "git@github.com:" = {
      insteadOf = "gh:";
    };
    "git@github.com:jp-zuniga/" = {
      insteadOf = "jpz:";
    };
  };
}
