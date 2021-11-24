import 'package:havartye/constents/constant.dart';
import 'package:havartye/model/sign_model.dart';
import 'package:http/http.dart' as http;

class SigninController{

  static Future<http.Response> requestThenResponsePrint(SignInModel signInModel) async {

    String havartye = apiDomainRoot;
    // This is a url for the request
    var url = '$havartye/api/login';

    Map login = {
      'name': "${signInModel.name}",
      'password': "${signInModel.password}",
    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: login,
        headers: {
          "Accept": "application/json",
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}