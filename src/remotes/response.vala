// This file is part of Fanboy. License: GPL-3.0+.

public abstract class Fanboy.Remotes.Response : Object {
  public Soup.Message message { get; construct set; }
  public uint status_code { get; construct set; }

  public Response(Soup.Message message) {
    Object(message: message, status_code: message.status_code);
  }

  public abstract bool is_success();
}

public class Fanboy.Remotes.SuccessResponse : Fanboy.Remotes.Response {
  public Json.Node parsed_root { get; private set; }

  public SuccessResponse(Soup.Message message, Json.Node parsed_root) {
    base(message);
    this.parsed_root = parsed_root;
  }

  public override bool is_success() {
    return true;
  }
}

public class Fanboy.Remotes.FailureResponse : Fanboy.Remotes.Response {
  public string error_message { get; private set; }

  public FailureResponse(Soup.Message message, string error_message = "") {
    base(message);
    if (error_message == "") {
      var status_code = this.status_code;
      var body = (string) this.message.response_body.data;
      this.error_message = @"$status_code : $body";
    } else {
      this.error_message = error_message;
    }
  }

  public override bool is_success() {
    return false;
  }
}
