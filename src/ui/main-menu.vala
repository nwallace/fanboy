// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/main-menu.ui")]
class Fanboy.UI.MainMenu : Gtk.ApplicationWindow {

  private Fanboy.Remotes.Tournaments remote;

  [GtkChild]
  private Gtk.Spinner loading_spinner;

  [GtkChild]
  private Gtk.Box tournament_list;

  public MainMenu(Gtk.Application app, Fanboy.Remotes.Tournaments remote) {
    Object(application: app);
    this.remote = remote;
    remote.get_tournaments.begin((obj, res) => {
      Gee.LinkedList<string> tournament_names = remote.get_tournaments.end(res);
      this.tournament_list.remove(this.loading_spinner);
      foreach (string name in tournament_names) {
        register_tournament(name);
      }
    });
  }

  private Fanboy.UI.TournamentListItem register_tournament(string name) {
    var list_item = new Fanboy.UI.TournamentListItem();
    list_item.tournament_name = name;
    this.tournament_list.add(list_item);
    return list_item;
  }
}
