// This file is part of Fanboy. License: GPL-3.0+.

class Fanboy.Controller : Object {

  public Fanboy.UI.ApplicationWindow ui { get; private set; }

  public Controller(Fanboy.UI.ApplicationWindow ui) {
    this.ui = ui;
  }

  public void load_titles() {
    var remote = new Fanboy.Remotes.Titles();
    remote.get_titles.begin((obj, res) => {
      Fanboy.Remotes.Response response = remote.get_titles.end(res);
      if (response.is_success()) {
        var titles = ((Fanboy.Remotes.Titles.SuccessResponse) response).get_titles();
        this.ui.display_titles(titles);
        this.load_tournaments(titles[0]);
      } else {
        this.ui.display_error(((Fanboy.Remotes.FailureResponse) response).error_message);
      }
    });
  }

  public void load_tournaments(Fanboy.Models.Title title) {
    var remote = new Fanboy.Remotes.Tournaments();
    remote.get_tournaments.begin(title.tournaments_uri, (obj, res) => {
      Fanboy.Remotes.Response response = remote.get_tournaments.end(res);
      if (response.is_success()) {
        var tournaments = ((Fanboy.Remotes.Tournaments.SuccessResponse) response).get_tournaments();
        this.ui.display_tournaments(tournaments);
      } else {
        this.ui.display_error(((Fanboy.Remotes.FailureResponse) response).error_message);
      }
    });
  }
}
