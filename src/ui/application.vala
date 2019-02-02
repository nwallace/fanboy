// This file is part of Fanboy. License: GPL-3.0+.

class Fanboy.Application : Gtk.Application {

  public Application() {
    Object(
      application_id: "com.github.nwallace.fanboy",
      flags: ApplicationFlags.FLAGS_NONE
    );
  }

  protected override void activate() {
    var window = active_window;

    window = new Fanboy.MainMenu(this);
    window.destroy.connect(quit);

    window.present();
  }
}
