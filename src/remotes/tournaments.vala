// This file is part of Fanboy. License: GPL-3.0+.

class Fanboy.Remotes.Tournaments {

  public async Gee.LinkedList<string> get_tournaments() {
    SourceFunc callback = get_tournaments.callback;
    var tournament_names = new Gee.LinkedList<string>();
    ThreadFunc<bool> run = () => {
      Thread.usleep(1000000);
      tournament_names.add("1: Big Major Number 1");
      tournament_names.add("2: Wee Minor Number 1");
      tournament_names.add("3: Big Major Number 2");
      tournament_names.add("4: Wee Minor Number 2");
      tournament_names.add("5: Wee Minor Number 3");
      tournament_names.add("6: Big Major Number 3");
      Idle.add((owned) callback);
      return true;
    };
    new Thread<bool>("Get tournaments", run);
    yield;
    return tournament_names;
  }
}
