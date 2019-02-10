public class Fanboy.Models.Tournament : Object {

  public string title     { get; private set; }
  public string name      { get; private set; }
  public Date starts      { get; private set; }
  public Date ends        { get; private set; }
  public string uri       { get; private set; }
  public string? logo_uri { get; private set; }

  public Tournament(Json.Object data) {
    this.title    = data.get_string_member("title");
    this.name     = data.get_string_member("name");
    this.starts   = parse_date(data.get_string_member("starts"));
    this.ends     = parse_date(data.get_string_member("ends"));
    this.logo_uri = data.get_string_member("logo_uri");
  }

  private Date? parse_date(string date_str) {
    if (date_str == null)
      return null;
    var date = Date();
    date.set_parse(date_str);
    return date;
  }
}
