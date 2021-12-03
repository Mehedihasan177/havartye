import 'package:havartye/constents/constant.dart';
import 'package:havartye/model/create_account_model.dart';
import 'package:havartye/model/withdraw_model.dart';
import 'package:http/http.dart' as http;
class WithdrawController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(String usertoken,WithDrawModel withDrawModel) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/withdraw';

    Map data1 = {
      'amount': "${withDrawModel.amount}",
      'method_name': "${withDrawModel.method_name}",
    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: data1,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $usertoken',
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}