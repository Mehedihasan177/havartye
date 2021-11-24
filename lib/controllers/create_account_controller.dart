import 'package:havartye/constents/constant.dart';
import 'package:havartye/model/create_account_model.dart';
import 'package:http/http.dart' as http;
class CreateAccountController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(String usertoken,CreateAccountModel createAccountModel) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/create-account';

    Map data1 = {
      'name': "${createAccountModel.name}",
      'user_name': "${createAccountModel.user_name}",
      'phone': "${createAccountModel.phone}",
      'nid_number': "${createAccountModel.nid_number}",
      'pos_id': "${createAccountModel.pos_id}",
      'email': "${createAccountModel.email}",
      'division_id': "${createAccountModel.division_id}",
      'district_id': "${createAccountModel.district_id}",
      'area': "${createAccountModel.area}",
      'password': "${createAccountModel.password}",
      'pos_id': "${createAccountModel.pos_id}",
      'position': "${createAccountModel.position}",
      'division_id': "${createAccountModel.division_id}",
      'district_id': "${createAccountModel.district_id}",
      //'district_id': "${createAccountModel.}",
    };

    print(data1);
    print("data1");

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