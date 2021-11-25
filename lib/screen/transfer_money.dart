import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:havartye/constents/constant.dart';
import 'package:havartye/controllers/balance_transfer_controller.dart';
import 'package:havartye/controllers/signIn_controller.dart';
import 'package:havartye/controllers/transaction_controller.dart';
import 'package:havartye/helper/alertDialogue.dart';
import 'package:havartye/model/sign_model.dart';
import 'package:havartye/responses/balance_transfer_responses.dart';
import 'package:havartye/responses/signIn_responses.dart';
import 'package:havartye/responses/transaction_responses.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';
import 'package:havartye/screen/dropdownforTransferMoneyPage.dart';
import 'package:havartye/screen/home_page.dart';

class TransferMoney extends StatefulWidget {
  const TransferMoney({Key? key}) : super(key: key);

  @override
  _TransferMoneyState createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  TextEditingController _textamountd = TextEditingController();
  TextEditingController _textpasswordd = TextEditingController();

  NewObject value = items.first;
  @override
  Widget build(BuildContext context) {
    int amount,password;
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0040A1),
          title: Text("Transfer Money"),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomNevigation()));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListView(children: [

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 30, bottom: 10),
                    child: Text(
                      "Outsourcing Wallet Balance: $OUTSOURCINGWALLET",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 30, bottom: 10),
                    child: Text(
                      "Select Wallet",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.067,
                      width: MediaQuery.of(context).size.width * 0.87,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<NewObject>(
                        isExpanded: true,
                        value: value, // currently selected item
                        items: items
                            .map((item) => DropdownMenuItem<NewObject>(
                          child: Row(
                            children: [
                              const SizedBox(width: 8),
                              Text(
                                item.title,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ],
                          ),
                          value: item,
                        ))
                            .toList(),
                        onChanged: (value) => setState(() {
                          this.value = value!;
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 17),

          Center(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 30, bottom: 10),
                  child: Text(
                    "Amount",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.067,
                  width: MediaQuery.of(context).size.width * 0.89,
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: _textamountd,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    //scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(color: Colors.teal),
                      ),
                      //contentPadding: EdgeInsets.all(20),
                      hintText: "Enter your amount",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 17),
          Center(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 30, bottom: 10),
                  child: Text(
                    "Password",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.067,
                  width: MediaQuery.of(context).size.width * 0.89,
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: _textpasswordd,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    //scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(color: Colors.teal),
                      ),
                      //contentPadding: EdgeInsets.all(20),
                      hintText: "Enter your  password",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 67),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.067,
                  width: MediaQuery.of(context).size.width * 0.30,
                  //color: Color(0xF60D72),
                  child: ElevatedButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () async {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));

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
                  height: MediaQuery.of(context).size.height * 0.067,
                  width: MediaQuery.of(context).size.width * 0.30,
                  //color: Color(0xF60D72),
                  child: ElevatedButton(
                    child: Text(
                      "Transfer",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () {
                      print("token of user\n");
                      print("token at call : " + APITOKEN);
                      BalanceTraNsferResponse pass = new BalanceTraNsferResponse(
                         msg: '', success: true, amount: _textamountd.text,

                      );
                      amount = int.parse(_textamountd.text);
                      password = int.parse(_textpasswordd.text) ;
                      if(amount > OUTSOURCINGWALLET){
                        AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Insufficient balance');
                      }
                      else if(amount == 0){
                        AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Balance is zero');
                      }
                      else if(amount == OUTSOURCINGWALLET || amount < OUTSOURCINGWALLET && password == USERPASS){
                        var param;
                        BalanceTransferController.requestThenResponsePrint(context,APITOKEN, param).then((value) {
                          print(value.statusCode);
                          if (value.statusCode == 200) {
                            print("successfully done");
                            print(value);
                            print(value.body);

                            TransactionRe withdraw = TransactionRe.fromJson(jsonDecode(value.body.toString()));
                            print(withdraw);
                            print(withdraw.amount);

                            signInAgain(context);


                          }else{
                            AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Please recheck mobile and password');
                          }
                        }
                        );
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
            ]
          ),
        ]
        ),
      ),
    );
  }


  Future<void> signInAgain(BuildContext context) async {
    EasyLoading.show(status: 'loading...');

    SignInModel myInfo = new SignInModel(
        password: USERPASS, name: USERNAME);
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

        USERNAME = USERNAME;
        USERPASS = USERPASS;
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
  }


}
