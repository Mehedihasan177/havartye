import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:havartye/constents/constant.dart';
import 'package:havartye/controllers/withdraw_controller.dart';
import 'package:havartye/dropdownforwithdrawTo.dart';
import 'package:havartye/helper/alertDialogue.dart';
import 'package:havartye/model/withdraw_model.dart';
import 'package:havartye/responses/balance_transfer_responses.dart';
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

  Withdraw value = withdrawitems.first;
  WithdrawTo values = withdrawtoitems.first;
    int passChange = 1;
  @override
  Widget build(BuildContext context) {
    int passw;
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0040A1),
          title: Text("Withdraw Money"),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomNevigation()));
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


              SizedBox(height: 17),
              Text(
                "Outsourcing Wallet Balance: $OUTSOURCINGWALLET",
                style: TextStyle(fontSize: 17),
              ),

              SizedBox(height: 40),
              //need

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
                            "Withdraw",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                            //Repository().placeAddApiProvider(int.parse(_section_id.text))
                          onPressed: () {
                            print("token of user\n");
                            print("token at call : " + APITOKEN);
                            WithDrawModel pass = new WithDrawModel(
                                amount: _textAmount.text,

                            );
                            passw = int.parse(_textAmount.text);
                            if(passw > OUTSOURCINGWALLET){
                              AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Insufficient balance');
                            }
                            else if(passw == 0){
                              AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Balance is zero');
                            }
                            else if(passw == OUTSOURCINGWALLET || passw < OUTSOURCINGWALLET){
                              WithdrawController.requestThenResponsePrint(APITOKEN, pass).then((value) {
                                print(value.statusCode);
                                if (value.statusCode == 200) {
                                  print("successfully done");
                                  print(value);
                                  print(value.body);

                                  WithdrawResponse withdraw = WithdrawResponse.fromJson(jsonDecode(value.body.toString()));
                                  print(withdraw);
                                  print(withdraw.msg);


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
              SizedBox(height: 17),
            ]
            ),
          ),
        ),
      ),
    );
  }
}
