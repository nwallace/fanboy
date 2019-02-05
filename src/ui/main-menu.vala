// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/main-menu.ui")]
class Fanboy.UI.MainMenu : Gtk.ApplicationWindow {

  [GtkChild]
  private Gtk.Spinner loading_spinner;

  [GtkChild]
  private Gtk.Box tournament_list;

  public MainMenu(Gtk.Application app) {
    Object(application: app);
  }

  public void display_tournaments(Gee.LinkedList<string> tournament_names) {
    this.tournament_list.remove(this.loading_spinner);
    foreach (string name in tournament_names) {
      register_tournament(name);
    }
  }

  public void display_error(string message) {
    this.tournament_list.remove(this.loading_spinner);
    var label = new Gtk.Label(@"Oops! $message");
    label.visible = true;
    this.tournament_list.add(label);
  }

  private Fanboy.UI.TournamentListItem register_tournament(string name) {
    var list_item = new Fanboy.UI.TournamentListItem();
    list_item.tournament_name = name;
    this.tournament_list.add(list_item);
    return list_item;
  }
}
