import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.url);
  final String url;

  Future get() async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
