// This file is part of Fanboy. License: GPL-3.0+.

public class Fanboy.Utils.Images {

  public async static Gdk.Pixbuf? download(string uri, int width, int height) {
    var session = new Soup.Session();
    SourceFunc callback = download.callback;
    InputStream stream = null;
    ThreadFunc<bool> run = () => {
      try {
        Soup.Request request = session.request(uri);
        stream = request.send();
      } catch (Error e) {}
      Idle.add((owned) callback);
      return true;
    };
    new Thread<bool>("Download image", run);
    yield;
    try {
      if (stream != null) {
        return new Gdk.Pixbuf.from_stream_at_scale(stream, width, height, true);
      } else {
        return null;
      }
    } catch (Error e) {
      return null;
    }
  }
}
