// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/tournament.ui")]
class Fanboy.UI.Tournament : Gtk.Box {

  public Fanboy.Models.Tournament tournament {
    set {
      this.name_label.label = value.name;
      this.logo_image.uri = value.logo_uri;
    }
  }

  [GtkChild]
  public Gtk.Label name_label;

  [GtkChild]
  public Fanboy.UI.WebImage logo_image;
}
