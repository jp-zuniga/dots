{
  pkgs,
  theme,
}:
pkgs.writeText "config.rasi" ''
  @import "default"

  configuration {
    display-drun: "";
    disable-history: true;
    drun-display-format: "– {name}";
    no-levenshtein-sort: true;
    show-icons: false;
  }

  * {
    font: "mono 16";
    margin: 0px;
    padding: 0px;
    spacing: 0px;

    background: ${theme.bg};
    foreground: ${theme.text};

    bordercolor: ${theme.rose};
    textcolor: ${theme.text};

    active-background: ${theme.pine};
    urgent-background: ${theme.love};

    selected-background: ${theme.muted};
    selected-active-background: @active-background;
    selected-urgent-background: @urgent-background;
  }

  #window {
    anchor: center;
    border: 3px;
    border-color: ${theme.muted};
    border-radius: 0px;
    enabled: true;
    fullscreen: false;
    height: 480px;
    location: center;
    padding: 20px;
    width: 350px;
  }

  #mainbox {
    spacing: 10px;
  }

  #inputbar {
    border: 2px;
    border-color: @bordercolor;
    border-radius: 5px;
    children: [ textbox-prompt-colon, entry ];
    padding: 5px;
    spacing: 0px;
  }

  #textbox-prompt-colon {
    str:        ">";
    text-color: ${theme.rose};
    padding:    0px 5px 0px 0px;
  }

  #entry {
    padding: 0px;
    placeholder: "Search...";
    placeholder-color: ${theme.muted};
    spacing: 0px;
    text-color: ${theme.rose};
  }

  #listview {
    border: 2px;
    border-color: ${theme.iris};
    border-radius: 5px;
    scrollbar: false;
    padding: 0px;
    spacing: 0px;
  }

  #element {
    border: 0px;
    padding: 0px 5px 0px 5px;
    spacing: 0px;
  }

  #element.normal.normal {
    background-color: transparent;
  }

  #element.normal.urgent {
    background-color: @urgent-background;
  }

  #element.normal.active {
      background-color: @active-background;
      text-color: @background;
  }

  #element.selected.normal {
    background-color: @selected-background;
    text-color: ${theme.foam};
  }

  #element.selected.urgent {
    background-color: @selected-urgent-background;
  }

  #element.selected.active {
    background-color: @selected-active-background;
    text-color: @background;
  }

  #element.alternate.normal {
    background-color: transparent;
  }

  #element.alternate.urgent {
    background-color: @urgent-background;
  }

  #element.alternate.active {
    background-color: @active-background;
  }
''
