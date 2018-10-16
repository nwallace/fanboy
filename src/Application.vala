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
    grid.row_spacing = 6;
    grid.column_spacing = 6;

    var hello_button = new Gtk.Button.with_label("Say Hi");
    var hello_label = new Gtk.Label(null);

    var rotate_button = new Gtk.Button.with_label("Rotate");
    var rotate_label = new Gtk.Label("Horizontal");

    hello_button.clicked.connect(() => {
      hello_label.label = "Howdy!";
      hello_button.sensitive = false;
    });

    rotate_button.clicked.connect(() => {
      if (grid.orientation == Gtk.Orientation.HORIZONTAL) {
        rotate_label.label = "Vertical";
        grid.orientation = Gtk.Orientation.VERTICAL;
      } else {
        rotate_label.label = "Horizontal";
        grid.orientation = Gtk.Orientation.HORIZONTAL;
      }
    });


    grid.attach(hello_button, 0, 0, 1, 1); // widget, column #, row #, colspan, rowspan
    grid.attach_next_to(hello_label, hello_button, Gtk.PositionType.RIGHT, 1, 1);
    grid.attach(rotate_button, 0, 1, 1, 1);
    grid.attach_next_to(rotate_label, rotate_button, Gtk.PositionType.RIGHT, 1, 1);

    window.add(grid);
    window.show_all();
  }
}

public int main(string[] args) {
  return new Fanboy().run(args);
}
