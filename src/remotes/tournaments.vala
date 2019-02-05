// This file is part of Fanboy. License: GPL-3.0+.

public class Fanboy.Remotes.Tournaments : Object {

  const string REMOTE_URI = "https://jsonplaceholder.typicode.com/albums";

  public Soup.Session session { get; private set; }

  construct {
    if (this.session == null) {
      this.session = new Soup.Session();
    }
  }

  public async Fanboy.Remotes.Response get_tournaments() {
    SourceFunc callback = get_tournaments.callback;
    var message = new Soup.Message("GET", REMOTE_URI);
    ThreadFunc<bool> run = () => {
      this.session.send_message(message);
      Idle.add((owned) callback);
      return true;
    };
    new Thread<bool>("Get tournaments", run);
    yield;
    return wrap_soup_message(message);
  }

  private Fanboy.Remotes.Response wrap_soup_message(Soup.Message message) {
    Json.Node parsed_root = null;
    var body = (string) message.response_body.flatten().data;
    try {
      var parser = new Json.Parser();
      parser.load_from_data(body);
      parsed_root = parser.get_root();
    } catch (Error e) {
      var error_message = e.message;
      var status_code = message.status_code;
      return new FailureResponse(message, @"Invalid JSON response - $error_message : $status_code : $body");
    }
    if (200 <= message.status_code < 300) {
      return new SuccessResponse(message, parsed_root);
    } else {
      return new Fanboy.Remotes.FailureResponse(message);
    }
  }

  public class SuccessResponse : Fanboy.Remotes.SuccessResponse {
    public SuccessResponse(Soup.Message message, Json.Node parsed_root) {
      base(message, parsed_root);
    }

    public Gee.LinkedList<Fanboy.Models.Tournament> get_tournaments() {
      var tournaments = new Gee.LinkedList<Fanboy.Models.Tournament>();
      foreach (Json.Node tournament_data in this.parsed_root.get_array().get_elements()) {
        var tournament = new Fanboy.Models.Tournament(tournament_data.get_object());
        tournaments.add(tournament);
      }
      return tournaments;
    }
  }
}
