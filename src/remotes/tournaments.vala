// This file is part of Fanboy. License: GPL-3.0+.

class Fanboy.Remotes.Tournaments {

  const string REMOTE_URI = "https://jsonplaceholder.typicode.com/albums";

  public async Gee.LinkedList<string> get_tournaments() {
    SourceFunc callback = get_tournaments.callback;
    var tournament_names = new Gee.LinkedList<string>();
    ThreadFunc<bool> run = () => {
      var client = new Fanboy.Remotes.Client();
      var response = client.get(REMOTE_URI);
      foreach (string name in response.get_tournaments()) {
        tournament_names.add(name);
      }
      Idle.add((owned) callback);
      return true;
    };
    new Thread<bool>("Get tournaments", run);
    yield;
    return tournament_names;
  }
}
