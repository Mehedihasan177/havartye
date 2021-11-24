import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:havartye/constents/constant.dart';
import 'package:havartye/controllers/signIn_controller.dart';
import 'package:havartye/helper/alertDialogue.dart';
import 'package:havartye/model/sign_model.dart';
import 'package:havartye/responses/signIn_responses.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';
import 'package:havartye/screen/otp.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'package:sharedpreference/Login/login_model.dart';
// import 'package:sharedpreference/Login/login_response.dart';
// import 'package:sharedpreference/bottomnevigation/bottomnevigation.dart';
// import 'package:sharedpreference/constents/constant.dart';
// import 'package:sharedpreference/Login/login_controller.dart';
// import 'package:sharedpreference/forgetPassword/forgetPasswordScreen.dart';
// import 'package:sharedpreference/helper/alertDialogue.dart';
// import 'package:sharedpreference/homepage.dart';
// import 'package:sharedpreference/registration/registrationScreen.dart';
//
//
// import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isloading = false;
  bool _passwordVisible = false;
  TextEditingController _textEmail = TextEditingController(text: 'b');
  TextEditingController _textPassword = TextEditingController(text: '123456789');
  @override
  void initState() {
    // TODO: implement initState
    _passwordVisible = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(

        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              child: Image(
                image: AssetImage("assets/havartye.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.perm_identity_rounded,
                      size: 18,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextField(
                  controller: _textEmail,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  //scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.all(20),
                    hintText: "Enter your name",
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 18,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextField(
                  controller: _textPassword,
                  obscureText: !_passwordVisible,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  //scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.all(20),
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),

          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.75,
              //color: Color(0xF60D72),
              child: ElevatedButton(
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  EasyLoading.show(status: 'loading...');

                  SignInModel myInfo = new SignInModel(
                      password: _textPassword.text, name: _textEmail.text);
                  await SigninController.requestThenResponsePrint(myInfo)
                      .then((value) async {
                    print(value.statusCode);
                    print(value.body);
                    final Map parsed = json.decode(value.body);

                    final loginobject = SignInResponse.fromJson(parsed);
                    SIGNINRESPONSE = loginobject;
                    print(loginobject.accessToken);

                    OUTSOURCINGWALLET = SIGNINRESPONSE.data.outsourcing;
                    CASHWALLET = SIGNINRESPONSE.data.cash;



                    APITOKEN = loginobject.accessToken;
                    // sharedPreferences.setString("token", loginobject.accessToken);
                    EasyLoading.dismiss();
                    if (value.statusCode == 200) {
                      print("name: " + _textEmail.text);
                      print("password: "+ _textPassword.text);
                      // sharedPreferences.setString("name", _textEmail.text);
                      // sharedPreferences.setString("password", _textPassword.text);
                      USERNAME = _textEmail.text;
                      USERPASS = _textPassword.text;
                      return Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNevigation()),
                      );
                    } else {
                      // return LoginController.requestThenResponsePrint(jsonData);
                      AlertDialogueHelper().showAlertDialog(context, 'Warning',
                          'Please recheck email and password');
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0040A1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              decoration: BoxDecoration(
                  //color: Color(0xF60D72),
                  borderRadius: BorderRadius.circular(18)),
            ),
          ),
        ],
      ),
    );
  }
}
