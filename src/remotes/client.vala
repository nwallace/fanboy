// This file is part of Fanboy. License: GPL-3.0+.

class Fanboy.Remotes.Client {

  private Soup.Session session;

  public Client() {
    this.session = new Soup.Session();
  }

  public Fanboy.Remotes.Response get(string uri) {
    var message = new Soup.Message("GET", uri);
    this.session.send_message(message);
    return new Response(message);
  }
}
