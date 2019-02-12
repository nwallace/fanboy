// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/application-window.ui")]
class Fanboy.UI.ApplicationWindow : Gtk.ApplicationWindow {

  [GtkChild]
  private Gtk.Spinner sidebar_loading_spinner;

  [GtkChild]
  private Gtk.Box sidebar;

  [GtkChild]
  private Gtk.Stack content;

  /* [GtkChild] */
  /* private Gtk.Spinner content_loading_spinner; */

  [GtkChild]
  private Gtk.Box tournaments_list;

  [GtkChild]
  private Fanboy.UI.Tournament tournament;

  public ApplicationWindow(Gtk.Application app) {
    Object(application: app);
  }

  public void display_titles(Gee.LinkedList<Fanboy.Models.Title> titles) {
    this.sidebar.remove(this.sidebar_loading_spinner);
    foreach (Fanboy.Models.Title title in titles) {
      display_title(title);
    }
  }

  public void display_tournaments(Gee.LinkedList<Fanboy.Models.Tournament> tournaments) {
    foreach (Fanboy.Models.Tournament tournament in tournaments) {
      register_tournament(tournament);
    }
    this.content.set_visible_child(this.tournaments_list);
  }

  public void display_tournament(Fanboy.Models.Tournament tournament) {
    this.tournament.tournament = tournament;
    this.content.set_visible_child(this.tournament);
  }

  public void display_error(string message) {
    this.sidebar.remove(this.sidebar_loading_spinner);
    var label = new Gtk.Label(@"Oops! $message");
    label.visible = true;
    label.wrap = true;
    this.content.add(label);
    this.content.set_visible_child(label);
  }

  private Fanboy.UI.TitleListItem display_title(Fanboy.Models.Title title) {
    var list_item = new Fanboy.UI.TitleListItem(title);
    this.sidebar.add(list_item);
    return list_item;
  }

  private Fanboy.UI.TournamentListItem register_tournament(Fanboy.Models.Tournament tournament) {
    var list_item = new Fanboy.UI.TournamentListItem(tournament);
    this.tournaments_list.add(list_item);
    list_item.selected.connect(this.display_tournament);
    return list_item;
  }

  private void empty(Gtk.Widget widget) {
  }
}
