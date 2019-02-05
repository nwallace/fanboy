public class Fanboy.Models.Tournament : Object {

  public string name { get; private set; }
  public string logo_uri { get; private set; }

  public Tournament(Json.Object data) {
    this.name = data.get_string_member("title");
    this.logo_uri = "https://images.techhive.com/images/idge/imported/article/nww/2014/01/012914-gnome-logo-100275262-orig.jpg";
  }
}
