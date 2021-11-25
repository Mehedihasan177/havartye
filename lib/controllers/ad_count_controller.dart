import 'package:havartye/constents/constant.dart';
import 'package:http/http.dart' as http;
class AdCountController{

  static Future<http.Response> requestThenResponsePrint(String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/ad-count';

    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}