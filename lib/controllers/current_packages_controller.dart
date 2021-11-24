import 'package:havartye/constents/constant.dart';
import 'package:http/http.dart' as http;
class CurrentPackagesController{

  static Future<http.Response> requestThenResponsePrint(String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/current-package';

    var response = await http.get(Uri.parse(url),
        headers: {
          //"Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}