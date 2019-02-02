// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/tournament-list-item.ui")]
class Fanboy.TournamentListItem : Gtk.EventBox {

  public string tournament_name {
    get { return name_label.label; }
    set { name_label.label = value; }
  }

  [GtkChild]
  public Gtk.Label name_label;
}
