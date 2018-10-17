/*
 * Copyright (c) 2018 Nathan Wallace (http://nosuchthingastwo.com)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA
 *
 * Authored by: Nathan Wallace <nathan@nosuchthingastwo.com>
 */

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/main-menu.ui")]
class Fanboy.MainMenu : Gtk.ApplicationWindow {
  public MainMenu(Gtk.Application app) {
    Object(application: app);
  }
}

class Fanboy.Application : Gtk.Application {
  public Application() {
    Object(
      application_id: "com.github.nwallace.fanboy",
      flags: ApplicationFlags.FLAGS_NONE
    );
  }

  protected override void activate() {
    var window = active_window;

    if (window == null) {
      window = new Fanboy.MainMenu(this);
      window.destroy.connect(quit);
    }

    window.present();
  }
}

public int main(string[] args) {
  return new Fanboy.Application().run(args);
}
