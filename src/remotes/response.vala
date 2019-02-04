// This file is part of Fanboy. License: GPL-3.0+.

class Fanboy.Remotes.Response {
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
