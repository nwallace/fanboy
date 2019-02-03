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

    var tournaments_remote = new Fanboy.Remotes.Tournaments();
    window = new Fanboy.UI.MainMenu(this, tournaments_remote);
    window.destroy.connect(quit);

    window.present();
  }
}
