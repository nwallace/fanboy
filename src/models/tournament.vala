public class Fanboy.Models.Tournament : Object {

  public string name { get; private set; }

  public Tournament(Json.Object data) {
    this.name = data.get_string_member("title");
  }
}
