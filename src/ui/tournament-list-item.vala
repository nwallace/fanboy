// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/tournament-list-item.ui")]
class Fanboy.UI.TournamentListItem : Gtk.EventBox {

  public signal void selected(Fanboy.Models.Tournament tournament);

  [GtkChild]
  public Gtk.Label name_label;

  [GtkChild]
  public Fanboy.UI.WebImage logo_image;

  Fanboy.Models.Tournament tournament;

  public TournamentListItem(Fanboy.Models.Tournament tournament) {
    this.name_label.label = tournament.name;
    this.logo_image.uri = tournament.logo_uri;
    this.tournament = tournament;
  }

  [GtkCallback]
  public bool on_selected() {
    this.selected(this.tournament);
    return true;
  }
}
