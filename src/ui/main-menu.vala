// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/main-menu.ui")]
class Fanboy.MainMenu : Gtk.ApplicationWindow {

  [GtkChild]
  private Gtk.Label name_label;

  public MainMenu(Gtk.Application app) {
    Object(application: app);
    this.name_label.set_label("Big Major Number 1");
  }
}
