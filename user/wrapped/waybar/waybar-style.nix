{
  pkgs,
  theme,
}:
pkgs.writeText "style.css" ''
  * {
      border:        0px;
      border-radius: 0px;
      box-shadow:    none;
      font-family:   monospace;
      font-size:     12pt;
      font-weight:   bold;
      margin:        0px;
      padding:       0px;
      text-shadow:   none;
  }

  tooltip {
      background:    ${theme.bg};
      border:        3px solid ${theme.muted};
      border-radius: 5px;
  }

  #waybar.main {
      background: transparent;
  }

  #waybar.main.modules-center
  #waybar.main.modules-left
  #waybar.main.modules-right {
      background:    ${theme.bg};
      border:        3px solid ${theme.muted};
      border-radius: 5px;
  }

  #waybar.main #battery,
  #waybar.main #backlight,
  #waybar.main #clock,
  #waybar.main #cpu,
  #waybar.main #disk,
  #waybar.main #language,
  #waybar.main #memory.ram,
  #waybar.main #network,
  #waybar.main #pulseaudio,
  #waybar.main #temperature,
  #waybar.main #tray,
  #waybar.main #window,
  #waybar.main #workspaces {
      background:     ${theme.bg};
      border:         3px solid ${theme.muted};
      border-radius:  5px;
      padding-top:    0px;
      padding-bottom: 0px;
      padding-left:   10px;
      padding-right:  10px;
  }

  #waybar.main #tray menu {
      background:    ${theme.bg};
      border:        3px solid ${theme.muted};
      border-radius: 5px;
      color:         ${theme.foam};
      padding:       3px;
  }

  #waybar.main #tray > .active,
  #waybar.main #tray > .passive,
  #waybar.main #tray > .needs-attention {
      border-radius: 5px;
  }

  #waybar.main #workspaces button {
      background:    transparent;
      color:         ${theme.muted};
      transition:    all 0.25s ease;
  }

  #waybar.main #workspaces button.visible {
      color: ${theme.rose};
  }

  #waybar.main #workspaces button.active {
      color: ${theme.gold};
  }

  #waybar.main #workspaces button:hover {
      color: ${theme.love};
  }

  #waybar.main #clock {
      color: ${theme.iris};
  }

  #waybar.main #temperature,
  #waybar.main #cpu,
  #waybar.main #memory.ram,
  #waybar.main #disk,
  #waybar.main #network {
      color: ${theme.foam};
  }

  #waybar.main #network.disconnected {
      color: ${theme.muted};
  }

  #waybar.main #language,
  #waybar.main #pulseaudio,
  #waybar.main #backlight,
  #waybar.main #battery {
      color: ${theme.pine};
  }

  #waybar.main #battery {
      padding-right: 10px;
  }

  #waybar.main #battery.warning,
  #waybar.main #cpu.warning,
  #waybar.main #memory.ram.warning,
  #waybar.main #temperature.warning {
      color: ${theme.rose};
  }

  #waybar.main #battery.critical,
  #waybar.main #cpu.critical,
  #waybar.main #memory.ram.critical,
  #waybar.main #temperature.critical {
      color: ${theme.love};
  }

  #waybar.main #pulseaudio.output.muted,
  #waybar.main #pulseaudio.input.source-muted {
      color: ${theme.muted};
  }
''
