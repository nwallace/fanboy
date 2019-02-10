// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/title-list-item.ui")]
class Fanboy.UI.TitleListItem : Gtk.Box {

  [GtkChild]
  public Fanboy.UI.WebImage logo_image;

  public TitleListItem(Fanboy.Models.Title title) {
    this.logo_image.uri = title.logo_uri;
  }
}
