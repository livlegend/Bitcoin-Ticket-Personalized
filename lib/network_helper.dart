import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String base_url = "http://smsoeildafric.top/testb.php";

  void getData() async {
    http.Response response = await http.get(base_url);
    if (response.statusCode == 200) {
      //la connexion a été établit
      String data = response.body;
      var decodedData = jsonDecode(data);
      print(decodedData);
    } else {
      print(response.statusCode);
    }
  }
}
