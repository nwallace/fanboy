// This file is part of Fanboy. License: GPL-3.0+.

class Fanboy.Application : Gtk.Application {

  private const string APP_ID = "com.github.nwallace.fanboy";
  private const string PACKAGE_VERSION = "0.0.0";

  private const GLib.ActionEntry[] ACTION_ENTRIES = {
    { "about", display_about }
  };

  private Gtk.Window window;

  public Application() {
    Object(
      application_id: APP_ID,
      flags: ApplicationFlags.FLAGS_NONE
    );
  }

  protected override void activate() {
    var window = active_window;

    window = new Fanboy.UI.ApplicationWindow(this);
    window.destroy.connect(quit);

    var controller = new Fanboy.Controller((Fanboy.UI.ApplicationWindow) window);
    controller.load_titles();

    this.window = window;
    add_action_entries(ACTION_ENTRIES, window);
    window.present();
  }

  public void display_about() {
    string[] authors = {
      "Nathan Wallace <nathan@nosuchthingastwo.com>"
    };
    Gtk.show_about_dialog(
      this.window,
      "authors", authors,
      "program-name", "Fanboy",
      "title", "About Fanboy",
      "comments", "Watch your favorite eSports, spoiler free.",
      "copyright", "© 2018 Nathan Wallace",
      "license-type", Gtk.License.GPL_3_0,
      "logo-icon-name", APP_ID,
      "version", PACKAGE_VERSION,
      "website", "https://github.com/nwallace/fanboy",
      "wrap-license", true);
  }
}
