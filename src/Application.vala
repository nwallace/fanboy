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

class MyApp : Gtk.Application {
  public MyApp() {
    Object(
      application_id: "com.github.nwallace.fanboy",
      flags: ApplicationFlags.FLAGS_NONE
    );
  }

  protected override void activate() {
    var window = new Gtk.ApplicationWindow(this);
    var hello_button = new Gtk.Button.with_label(_("Click me!"));
    hello_button.margin = 12;
    hello_button.clicked.connect(() => {
      hello_button.label = _("Hello World!");
      hello_button.sensitive = false;
    });
    window.set_title(_("Welcome to GNOME"));
    window.set_default_size(300, 300);
    window.add(hello_button);
    window.show_all();
  }
}

public int main(string[] args) {
  return new MyApp().run(args);
}
