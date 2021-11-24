import 'package:havartye/constents/constant.dart';
import 'package:havartye/responses/transaction_responses.dart';
import 'package:http/http.dart' as http;
class WithdrawHistoryController{

  static Future<http.Response> requestThenResponsePrint(String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/my-withdraw';

    var response = await http.get(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}