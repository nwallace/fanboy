// This file is part of Fanboy. License: GPL-3.0+.

class Fanboy.Remotes.Client {

  private Soup.Session session;

  public Client() {
    this.session = new Soup.Session();
  }

  public class Response {
    private Soup.Message message;
    private Json.Node parsed_body_root;

    public Response(Soup.Message message) {
      this.message = message;
      var parser = new Json.Parser();
      parser.load_from_data((string) message.response_body.flatten().data);
      this.parsed_body_root = parser.get_root();
    }

    public Gee.LinkedList<string> get_tournaments() {
      var names = new Gee.LinkedList<string>();
      foreach (Json.Node tournament_data in this.parsed_body_root.get_array().get_elements()) {
        names.add(tournament_data.get_object().get_string_member("title"));
      }
      return names;
    }
  }

  public Response get(string uri) {
    var message = new Soup.Message("GET", uri);
    this.session.send_message(message);
    return new Response(message);
  }
}
