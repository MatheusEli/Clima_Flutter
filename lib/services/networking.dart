import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = 'de4b9f1560cf498ab378f59601e2e326';

class NetworkHelper {
  NetworkHelper(this.primaryUrl, this.secondUrl, this.object);

  final String primaryUrl;
  final String secondUrl;
  final Map<String, dynamic> object;

  getData() async {
    final url = Uri.https(primaryUrl, secondUrl, object);
    print(url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
