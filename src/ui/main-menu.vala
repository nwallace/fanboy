// This file is part of Fanboy. License: GPL-3.0+.

[GtkTemplate (ui = "/com/github/nwallace/fanboy/ui/main-menu.ui")]
class Fanboy.UI.MainMenu : Gtk.ApplicationWindow {

  [GtkChild]
  private Gtk.Box tournament_list;

  public MainMenu(Gtk.Application app) {
    Object(application: app);
    fetch_tournaments();
  }

  private void fetch_tournaments() {
    register_tournament("1: Big Major Number 1");
    register_tournament("2: Wee Minor Number 1");
    register_tournament("3: Big Major Number 2");
    register_tournament("4: Wee Minor Number 2");
    register_tournament("5: Wee Minor Number 3");
    register_tournament("6: Big Major Number 3");
  }

  private Fanboy.UI.TournamentListItem register_tournament(string name) {
    var list_item = new Fanboy.UI.TournamentListItem();
    list_item.tournament_name = name;
    this.tournament_list.add(list_item);
    return list_item;
  }
}
