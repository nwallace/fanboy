// This file is part of Fanboy. License: GPL-3.0+.

class Fanboy.Controllers.Tournaments {

  public void load_tournaments(Fanboy.UI.ApplicationWindow ui) {
    var remote = new Fanboy.Remotes.Tournaments();
    remote.get_tournaments.begin((obj, res) => {
      Fanboy.Remotes.Response response = remote.get_tournaments.end(res);
      if (response.is_success()) {
        ui.display_tournaments(((Fanboy.Remotes.Tournaments.SuccessResponse) response).get_tournaments());
      } else {
        ui.display_error(((Fanboy.Remotes.FailureResponse) response).error_message);
      }
    });
  }
}
