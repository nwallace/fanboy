// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/tournament-list-item.ui")]
class Fanboy.UI.TournamentListItem : Gtk.EventBox {

  [GtkChild]
  public Gtk.Label name_label;

  [GtkChild]
  public Fanboy.UI.WebImage logo_image;

  public TournamentListItem(Fanboy.Models.Tournament tournament) {
    this.name_label.label = tournament.name;
    this.logo_image.uri = tournament.logo_uri;
  }
}
