// This file is part of Fanboy. License: GPL-3.0+.

class Fanboy.Controllers.Tournaments {

  public void load_tournaments(Fanboy.UI.MainMenu ui) {
    var remote = new Fanboy.Remotes.Tournaments();
    remote.get_tournaments.begin((obj, res) => {
      Gee.LinkedList<string> tournament_names = remote.get_tournaments.end(res);
      ui.display_tournaments(tournament_names);
    });
  }
}
