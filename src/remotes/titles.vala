// This file is part of Fanboy. License: GPL-3.0+.

public class Fanboy.Remotes.Titles : Object {

  const string REMOTE_URI = "http://localhost:9292/api/v1/titles";

  public Soup.Session session { get; private set; }

  construct {
    if (this.session == null) {
      this.session = new Soup.Session();
    }
  }

  public async Fanboy.Remotes.Response get_titles() {
    SourceFunc callback = get_titles.callback;
    var message = new Soup.Message("GET", REMOTE_URI);
    ThreadFunc<bool> run = () => {
      this.session.send_message(message);
      Idle.add((owned) callback);
      return true;
    };
    new Thread<bool>("Get titles", run);
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

    public Gee.LinkedList<Fanboy.Models.Title> get_titles() {
      var titles = new Gee.LinkedList<Fanboy.Models.Title>();
      foreach (Json.Node title_data in this.parsed_root.get_object().get_array_member("titles").get_elements()) {
        var title = new Fanboy.Models.Title(title_data.get_object());
        titles.add(title);
      }
      return titles;
    }
  }
}
