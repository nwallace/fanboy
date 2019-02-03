// This file is part of Fanboy. License: GPL-3.0+.

class Fanboy.Remotes.Tournaments {

  public Fanboy.Remotes.TournamentsRetriever get_retriever(Gee.LinkedList<string> tournament_names, SourceFunc callback) {
    return new Fanboy.Remotes.TournamentsRetriever(tournament_names, callback);
  }
}

class Fanboy.Remotes.TournamentsRetriever {
  private Gee.LinkedList<string> tournament_names;
  private SourceFunc callback;

  public TournamentsRetriever(Gee.LinkedList<string> tournament_names, SourceFunc callback) {
    this.tournament_names = tournament_names;
    this.callback = callback;
  }

  public bool run() {
    Thread.usleep(1000000);
    tournament_names.add("1: Big Major Number 1");
    tournament_names.add("2: Wee Minor Number 1");
    tournament_names.add("3: Big Major Number 2");
    tournament_names.add("4: Wee Minor Number 2");
    tournament_names.add("5: Wee Minor Number 3");
    tournament_names.add("6: Big Major Number 3");
    Idle.add((owned) callback);
    return true;
  }
}
