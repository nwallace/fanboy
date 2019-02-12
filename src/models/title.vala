public class Fanboy.Models.Title : Object {

  public string name            { get; private set; }
  public string nickname        { get; private set; }
  public string developer       { get; private set; }
  public string uri             { get; private set; }
  public string logo_uri        { get; private set; }
  public string tournaments_uri { get; private set; }

  public Title(Json.Object data) {
    this.name            = data.get_string_member("name");
    this.nickname        = data.get_string_member("nickname");
    this.developer       = data.get_string_member("developer");
    this.uri             = data.get_string_member("uri");
    this.logo_uri        = data.get_string_member("logo_uri");
    this.tournaments_uri = data.get_string_member("tournaments_uri");
  }
}
