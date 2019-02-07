// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/application-window.ui")]
class Fanboy.UI.ApplicationWindow : Gtk.ApplicationWindow {

  [GtkChild]
  private Gtk.Spinner loading_spinner;

  [GtkChild]
  private Gtk.Box tournament_list;

  public ApplicationWindow(Gtk.Application app) {
    Object(application: app);
  }

  public void display_tournaments(Gee.LinkedList<Fanboy.Models.Tournament> tournaments) {
    this.tournament_list.remove(this.loading_spinner);
    foreach (Fanboy.Models.Tournament tournament in tournaments) {
      display_tournament(tournament);
    }
  }

  public void display_error(string message) {
    this.tournament_list.remove(this.loading_spinner);
    var label = new Gtk.Label(@"Oops! $message");
    label.visible = true;
    label.wrap = true;
    this.tournament_list.add(label);
  }

  private Fanboy.UI.TournamentListItem display_tournament(Fanboy.Models.Tournament tournament) {
    var list_item = new Fanboy.UI.TournamentListItem(tournament);
    this.tournament_list.add(list_item);
    return list_item;
  }
}
