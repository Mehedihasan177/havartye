import 'package:havartye/constents/constant.dart';
import 'package:http/http.dart' as http;
class PositionTrackingController{

  static Future<http.Response> requestThenResponsePrint(String token,int param) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/position-tracking?position=$param';
    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
    );
    return response;
  }

}