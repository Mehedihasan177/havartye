import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:havartye/constents/constant.dart';
import 'package:havartye/controllers/signIn_controller.dart';
import 'package:havartye/controllers/withdraw_controller.dart';
import 'package:havartye/dropdownforwithdrawTo.dart';
import 'package:havartye/helper/alertDialogue.dart';
import 'package:havartye/model/sign_model.dart';
import 'package:havartye/model/withdraw_model.dart';
import 'package:havartye/responses/balance_transfer_responses.dart';
import 'package:havartye/responses/signIn_responses.dart';
import 'package:havartye/responses/withdraw_response.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';
import 'package:havartye/screen/dropdownforwithdrawmoney.dart';
import 'package:havartye/screen/home_page.dart';

class WithdrawMoney extends StatefulWidget {
  const WithdrawMoney({Key? key}) : super(key: key);

  @override
  _WithdrawMoneyState createState() => _WithdrawMoneyState();
}

class _WithdrawMoneyState extends State<WithdrawMoney> {
  TextEditingController _textAmount = TextEditingController();
  TextEditingController _textPassword = TextEditingController();
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  Withdraw value = withdrawitems.first;
  WithdrawTo values = withdrawtoitems.first;
  int passChange = 1;
  int amount = 0;
  @override
  Widget build(BuildContext context) {
    int passw, amountt;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: Color(0xFF0040A1), // <-- your color
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF0040A1),
            title: Text("Withdraw Money"),
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNevigation()));
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              // color: Colors.red,
              alignment: Alignment.centerLeft,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 16, bottom: 10),
                          child: Text(
                            "Amount",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 390,
                          padding: EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: _textAmount,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.black),
                            //scrollPadding: EdgeInsets.all(10),
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: new BorderSide(color: Colors.teal),
                              ),
                              //contentPadding: EdgeInsets.all(20),
                              hintText: "Enter amount",
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 16, bottom: 10),
                          child: Text(
                            "Password",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 390,
                          padding: EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: _textPassword,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.black),
                            //scrollPadding: EdgeInsets.all(10),
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: new BorderSide(color: Colors.teal),
                              ),
                              //contentPadding: EdgeInsets.all(20),
                              hintText: "Enter password",
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 17),
                    Text(
                      "Cash Wallet Balance: $CASHWALLET",
                      style: TextStyle(fontSize: 17),
                    ),

                    SizedBox(height: 40),

                    ///gateway methods

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  //activeColor: Colors.red, //The color to use when this checkbox is checked.
                                  //checkColor: Colors.blue,

                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                                Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset("assets/bkash.png")),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  //activeColor: Colors.red, //The color to use when this checkbox is checked.
                                  //checkColor: Colors.blue,

                                  value: isChecked2,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked2 = value!;
                                    });
                                  },
                                ),
                                Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset("assets/nagad_image.png")),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  //activeColor: Colors.red, //The color to use when this checkbox is checked.
                                  //checkColor: Colors.blue,

                                  value: isChecked3,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked3 = value!;
                                    });
                                  },
                                ),
                                Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset("assets/rocket_logo.png")),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.067,
                              width: MediaQuery.of(context).size.width * 0.30,
                              //color: Color(0xF60D72),
                              child: ElevatedButton(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                onPressed: () async {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNevigation()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF0040A1).withOpacity(0.7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  //color: Color(0xF60D72),
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                          ),
                          SizedBox(width: 17),
                          Center(
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.067,
                              width: MediaQuery.of(context).size.width * 0.30,
                              //color: Color(0xF60D72),
                              child: ElevatedButton(
                                child: Text(
                                  "Withdraw",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                //Repository().placeAddApiProvider(int.parse(_section_id.text))
                                onPressed: () {
                                  print("token of user\n");
                                  print("token at call : " + APITOKEN);
                                  WithDrawModel pass = new WithDrawModel(
                                    amount: _textAmount.text,
                                  );
                                  amountt = int.parse(_textAmount.text);
                                  passw = int.parse(_textPassword.text);
                                  if (amountt < 500) {
                                    //amount = OUTSOURCINGWALLET - passw;
                                    AlertDialogueHelper().showAlertDialog(
                                        context, 'Warning', 'Minimum balance should be 500');
                                  } else if (amountt == 0) {
                                    AlertDialogueHelper().showAlertDialog(
                                        context, 'Warning', 'Balance is zero');
                                  } else if (amountt == 500 ||
                                      amountt > 500 || passw == USERPASS) {

                                      WithdrawController
                                              .requestThenResponsePrint(
                                                  APITOKEN, pass)
                                          .then((value) {
                                        print(value.statusCode);
                                        if (value.statusCode == 200) {
                                          print("successfully done");
                                          print(value);
                                          print(value.body);
                                          print(value.statusCode);

                                          WithdrawResponse withdraw =
                                              WithdrawResponse.fromJson(
                                                  jsonDecode(
                                                      value.body.toString()));
                                          //amount = OUTSOURCINGWALLET - amountt;
                                          print(withdraw);
                                          print(withdraw.msg);
                                          signInAgain(context);
                                          AlertDialogueHelper().showAlertDialog(
                                              context,
                                              '',
                                              'Withdraw Successful');
                                          signInAgain(context);
                                        } else {
                                          AlertDialogueHelper().showAlertDialog(
                                              context,
                                              'Warning',
                                              'Please recheck password or amount');
                                        }
                                      });

                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF0040A1).withOpacity(0.7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  //color: Color(0xF60D72),
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                          ),
                        ]),
                    SizedBox(height: 17),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInAgain(BuildContext context) async {
    EasyLoading.show(status: 'loading...');

    SignInModel myInfo = new SignInModel(password: USERPASS, name: USERNAME);
    await SigninController.requestThenResponsePrint(myInfo).then((value) async {
      print(value.statusCode);
      print(value.body);
      final Map parsed = json.decode(value.body);

      final loginobject = SignInResponse.fromJson(parsed);
      SIGNINRESPONSE = loginobject;
      print(loginobject.accessToken);

      OUTSOURCINGWALLET = SIGNINRESPONSE.data.outsourcing.floor();
      CASHWALLET = SIGNINRESPONSE.data.cash;

      APITOKEN = loginobject.accessToken;
      // sharedPreferences.setString("token", loginobject.accessToken);
      EasyLoading.dismiss();
      if (value.statusCode == 200) {
        USERNAME = USERNAME;
        USERPASS = USERPASS;
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNevigation()),
        );
      } else {
        // return LoginController.requestThenResponsePrint(jsonData);
        AlertDialogueHelper().showAlertDialog(
            context, 'Warning', 'Please recheck email and password');
      }
    });
  }
}
