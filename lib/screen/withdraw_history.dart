import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:havartye/constents/constant.dart';
import 'package:havartye/controllers/transaction_controller.dart';
import 'package:havartye/controllers/withdraw_history_controller.dart';
import 'package:havartye/responses/withdraw_history_responses.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';
import 'package:havartye/screen/profile_page.dart';
import 'package:intl/intl.dart';

class WithdrawHistory extends StatefulWidget {
  const WithdrawHistory({Key? key}) : super(key: key);

  @override
  _WithdrawHistoryState createState() => _WithdrawHistoryState();
}

class _WithdrawHistoryState extends State<WithdrawHistory> {
  List<Datum> withdraw = [];

  _getWithdrawHistory() async {
    WithdrawHistoryController.requestThenResponsePrint(APITOKEN).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        withdraw =
            listNotification.map((model) => Datum.fromJson(model)).toList();
        print(withdraw);
      });
    });
  }

  @override
  void initState() {
    _getWithdrawHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    withdraw = withdraw.reversed.toList();
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => BottomNevigation()));
          return true;
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Withdraw History'),
            ),
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: withdraw.length,
                          itemBuilder: (BuildContext context, int index) {
                            return buildWithdrawHistoryTile(withdraw[index]);
                          })),
                ],
              ),
            )));
  }
}

Widget buildWithdrawHistoryTile(Datum withdraw) => SingleChildScrollView(
      child: Card(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(bottom: 6),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Withdraw",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        padding: EdgeInsets.only(bottom: 6),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          withdraw.status,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    // Container(
                    //     padding: EdgeInsets.only(bottom: 6),
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(
                    //       withdraw.date.toString(),
                    //       style: TextStyle(
                    //         fontSize: 17,
                    //       ),
                    //     )),
                    // Container(
                    //     padding: EdgeInsets.only(bottom: 6),
                    //     alignment: Alignment.centerLeft,
                    //      child: Text("Wallet: " + withdraw.date.toString())),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(DateFormat("yyyy-MM-dd")
                            .format(withdraw.date))),
                    // Container(
                    //     alignment: Alignment.centerLeft,
                    //     child:
                    //         Text(DateFormat('kk').format(withdraw.date))),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text("+\৳ " + withdraw.amount.toString())),
            ],
          ),
        ),
      ),
    );
