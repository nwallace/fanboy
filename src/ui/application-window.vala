// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/application-window.ui")]
class Fanboy.UI.ApplicationWindow : Gtk.ApplicationWindow {

  [GtkChild]
  private Gtk.Spinner tournament_loading_spinner;

  [GtkChild]
  private Gtk.Spinner title_loading_spinner;

  [GtkChild]
  private Gtk.Box sidebar;

  [GtkChild]
  private Gtk.Box tournament_list;

  public ApplicationWindow(Gtk.Application app) {
    Object(application: app);
  }

  public void display_titles(Gee.LinkedList<Fanboy.Models.Title> titles) {
    this.sidebar.remove(this.title_loading_spinner);
    foreach (Fanboy.Models.Title title in titles) {
      display_title(title);
    }
  }

  public void display_tournaments(Gee.LinkedList<Fanboy.Models.Tournament> tournaments) {
    this.tournament_list.remove(this.tournament_loading_spinner);
    foreach (Fanboy.Models.Tournament tournament in tournaments) {
      display_tournament(tournament);
    }
  }

  public void display_error(string message) {
    this.sidebar.remove(this.title_loading_spinner);
    this.tournament_list.remove(this.tournament_loading_spinner);
    var label = new Gtk.Label(@"Oops! $message");
    label.visible = true;
    label.wrap = true;
    this.tournament_list.add(label);
  }

  private Fanboy.UI.TitleListItem display_title(Fanboy.Models.Title title) {
    var list_item = new Fanboy.UI.TitleListItem(title);
    this.sidebar.add(list_item);
    return list_item;
  }

  private Fanboy.UI.TournamentListItem display_tournament(Fanboy.Models.Tournament tournament) {
    var list_item = new Fanboy.UI.TournamentListItem(tournament);
    this.tournament_list.add(list_item);
    return list_item;
  }
}
