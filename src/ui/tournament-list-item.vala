// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/tournament-list-item.ui")]
class Fanboy.UI.TournamentListItem : Gtk.EventBox {

  [GtkChild]
  public Gtk.Label name_label;

  [GtkChild]
  public Gtk.Image logo_image;

  public TournamentListItem(Fanboy.Models.Tournament tournament) {
    this.name_label.label = tournament.name;
    this.logo_image.icon_name = "image-x-generic";
    load_logo(tournament.logo_uri);
  }

  private void load_logo(string uri) {
    Fanboy.Utils.Images.download.begin(uri, 48, -1, (obj, res) => {
      Gdk.Pixbuf pixbuf = Fanboy.Utils.Images.download.end(res);
      if (pixbuf != null) {
        this.logo_image.icon_name = null;
        this.logo_image.pixbuf = pixbuf;
      }
    });
  }
}
