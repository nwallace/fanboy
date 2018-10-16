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

class Fanboy : Gtk.Application {
  public Fanboy() {
    Object(
      application_id: "com.github.nwallace.fanboy",
      flags: ApplicationFlags.FLAGS_NONE
    );
  }

  protected override void activate() {
    var window = new Gtk.ApplicationWindow(this);
    window.set_title("Fanboy");
    window.set_default_size(300, 300);

    var grid = new Gtk.Grid();
    grid.orientation = Gtk.Orientation.VERTICAL;
    grid.row_spacing = 6;

    var button = new Gtk.Button.with_label("Poke me");
    var label = new Gtk.Label(null);

    button.clicked.connect(() => {
      label.label = "Ouch!";
      button.sensitive = false;
    });

    grid.add(button);
    grid.add(label);

    window.add(grid);
    window.show_all();
  }
}

public int main(string[] args) {
  return new Fanboy().run(args);
}
