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

    window = new Fanboy.UI.MainMenu(this);
    window.destroy.connect(quit);

    var controller = new Fanboy.Controllers.Tournaments();
    controller.load_tournaments((Fanboy.UI.MainMenu) window);

    window.present();
  }
}
