import 'package:havartye/constents/constant.dart';
import 'package:havartye/responses/transaction_responses.dart';
import 'package:http/http.dart' as http;
class DivisionController{

  static Future<http.Response> requestThenResponsePrint() async {

    String domain = apiDomainRoot;

    var url = '$domain/api/division';

    var response = await http.get(Uri.parse(url),
        headers: {
          // "Accept": "application/json",
          // 'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}