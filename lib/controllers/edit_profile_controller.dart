import 'package:havartye/constents/constant.dart';
import 'package:havartye/model/edit_profile_model.dart';
import 'package:http/http.dart' as http;
class EditProfileController {
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(String usertoken,
      EditProfileModel editProfileModel) async {
    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/edit-profile';

    Map data1 = {
      'image': "${editProfileModel.image}",
      'email': "${editProfileModel.email}",
      'area': "${editProfileModel.area}",
    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: data1,
        headers: {
          // "Accept": "application/json",
          'Authorization': 'Bearer $usertoken',
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }
}
