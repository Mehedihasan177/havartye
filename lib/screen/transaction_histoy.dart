import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:havartye/constents/constant.dart';
import 'package:havartye/controllers/transaction_controller.dart';
import 'package:havartye/responses/transaction_responses.dart';
import 'package:havartye/screen/profile_page.dart';
import 'package:intl/intl.dart';

class TransactionHistory extends StatefulWidget {
  final String toShowData;
  const TransactionHistory({Key? key, required this.toShowData}) : super(key: key);

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  List<TransactionRe> transaction = [];

  _getTransactionHistory() async {
    TransactionController.requestThenResponsePrint(APITOKEN).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        transaction = listNotification
            .map((model) => TransactionRe.fromJson(model))
            .toList();
        print(transaction);
      });
    });
  }

  @override
  void initState() {
    _getTransactionHistory();
    super.initState();
  }

  // DateTime now = DateTime.now();
  // String formattedDate = DateFormat('EEE d MMM   kk:mm:ss').format(now);
  @override
  Widget build(BuildContext context) {
    transaction = transaction.reversed.toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History'),),
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: transaction.length,
                  itemBuilder: (BuildContext context, int index) {
                    if(widget.toShowData=='income'){
                      if((transaction[index].type.toLowerCase()=='referral')||(transaction[index].type.toLowerCase()=='matching')){
                        return buildTransactionTile(transaction[index]);
                      }else{
                        return Container();
                      }

                    }else
                    return buildTransactionTile(transaction[index]);
                  })),
        ],
      ),
    ));
  }
}

Widget buildTransactionTile(TransactionRe transaction) => SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(bottom: 6),
                        alignment: Alignment.centerLeft,
                        child: Text(transaction.title.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 6),
                        alignment: Alignment.centerLeft,
                        child: Text(transaction.type.toString(),
                          style: TextStyle(
                              fontSize: 17,
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.only(bottom: 6),
                        alignment: Alignment.centerLeft,
                        child: Text("Wallet: "+transaction.wallet.toString())),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(DateFormat("yyyy-MM-dd")
                            .format(transaction.createdAt))),
                    // Container(
                    //     alignment: Alignment.centerLeft,
                    //     child:
                    //         Text(DateFormat('kk').format(transaction.createdAt))),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text("+\৳ " + transaction.amount.toString())),
            ],
          ),
        ),
      ),
    );
