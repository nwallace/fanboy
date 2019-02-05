// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/web-image.ui")]
class Fanboy.UI.WebImage : Gtk.Image {

  public int width  { get; set; default = -1; }
  public int height { get; set; default = -1; }
  public string uri {
    set {
      load_image(value);
    }
  }

  private void load_image(string uri) {
    Fanboy.Utils.Images.download.begin(uri, this.width, this.height, (obj, res) => {
      Gdk.Pixbuf pixbuf = Fanboy.Utils.Images.download.end(res);
      if (pixbuf != null) {
        this.icon_name = null;
        this.pixbuf = pixbuf;
      }
    });
  }
}

