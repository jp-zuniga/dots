# @ts: { theme: { variant: string, colors: Record<string, string>, cursor: { size: number, hypr: { name: string, package: Derivation, }, x: { name: string,package: Derivation, }, }, gtk: { name: string, package: Derivation, } } }
{theme, ...}: let
  inherit (theme) colors;
in ''
  @define-color accent_color ${colors.magenta};
  @define-color accent_bg_color ${colors.magenta};
  @define-color accent_fg_color ${colors.base};

  @define-color destructive_color ${colors.red};
  @define-color destructive_bg_color ${colors.red};
  @define-color destructive_fg_color ${colors.base};
  @define-color success_color ${colors.green};
  @define-color success_bg_color ${colors.green};
  @define-color success_fg_color ${colors.base};
  @define-color warning_color ${colors.yellow};
  @define-color warning_bg_color ${colors.yellow};
  @define-color warning_fg_color ${colors.base};
  @define-color error_color ${colors.red};
  @define-color error_bg_color ${colors.red};
  @define-color error_fg_color ${colors.base};

  @define-color window_bg_color ${colors.base};
  @define-color window_fg_color ${colors.foreground};
  @define-color view_bg_color ${colors.base};
  @define-color view_fg_color ${colors.foreground};

  @define-color headerbar_bg_color ${colors.accent};
  @define-color headerbar_fg_color ${colors.foreground};
  @define-color headerbar_border_color ${colors.accent};
  @define-color headerbar_backdrop_color @window_bg_color;
  @define-color headerbar_shade_color rgba(0, 0, 0, 0.07);

  @define-color sidebar_bg_color ${colors.accent};
  @define-color sidebar_fg_color ${colors.foreground};
  @define-color sidebar_backdrop_color @window_bg_color;
  @define-color sidebar_shade_color rgba(0, 0, 0, 0.07);

  @define-color card_bg_color ${colors.accent};
  @define-color card_fg_color ${colors.foreground};
  @define-color card_shade_color rgba(0, 0, 0, 0.07);

  @define-color dialog_bg_color ${colors.accent};
  @define-color dialog_fg_color ${colors.foreground};

  @define-color popover_bg_color ${colors.accent};
  @define-color popover_fg_color ${colors.foreground};
  @define-color popover_shade_color rgba(0, 0, 0, 0.07);

  @define-color scrollbar_outline_color ${colors.black};
  @define-color shade_color rgba(0, 0, 0, 0.07);
''
