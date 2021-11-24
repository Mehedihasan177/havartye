import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:havartye/screen/profile_page.dart';

class WithdrawHistory extends StatefulWidget {
  const WithdrawHistory({Key? key}) : super(key: key);

  @override
  _WithdrawHistoryState createState() => _WithdrawHistoryState();
}

class _WithdrawHistoryState extends State<WithdrawHistory> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0040A1),
          title: Text("Withdraw History"),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Center(
          child: Container(
            //color: Colors.red,
            width: MediaQuery.of(context).size.width * 0.95,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Withdraw Pending",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.087,
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //                 <--- border radius here
                            )
                          //contentPadding: EdgeInsets.all(20),
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Money Withdraw",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text(
                                        "25th Aug",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 20,),
                                      Text(
                                        "10 AM",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text("\$200",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 60,
                      ),

                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Withdraw History",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.087,
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //                 <--- border radius here
                            )
                          //contentPadding: EdgeInsets.all(20),
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Money Withdraw",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text(
                                        "25th Aug",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 20,),
                                      Text(
                                        "10 AM",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text("\$200",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.087,
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //                 <--- border radius here
                            )
                          //contentPadding: EdgeInsets.all(20),
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Money Withdraw",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text(
                                        "25th Aug",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 20,),
                                      Text(
                                        "10 AM",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text("\$200",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.087,
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //                 <--- border radius here
                            )
                          //contentPadding: EdgeInsets.all(20),
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Money Withdraw",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text(
                                        "25th Aug",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 20,),
                                      Text(
                                        "10 AM",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),                                child: Text("\$200",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.087,
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //                 <--- border radius here
                            )
                          //contentPadding: EdgeInsets.all(20),
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Money Withdraw",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text(
                                        "25th Aug",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 20,),
                                      Text(
                                        "10 AM",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),                                child: Text("\$200",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.087,
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //                 <--- border radius here
                            )
                          //contentPadding: EdgeInsets.all(20),
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Money Withdraw",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text(
                                        "25th Aug",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 20,),
                                      Text(
                                        "10 AM",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),                                child: Text("\$200",
                                style:
                                TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.087,
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //                 <--- border radius here
                            )
                          //contentPadding: EdgeInsets.all(20),
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Money Withdraw",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text(
                                        "25th Aug",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 20,),
                                      Text(
                                        "10 AM",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),                                child: Text("\$200",
                                style:
                                TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.087,
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //                 <--- border radius here
                            )
                          //contentPadding: EdgeInsets.all(20),
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Money Withdraw",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text(
                                        "25th Aug",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 20,),
                                      Text(
                                        "10 AM",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),                                child: Text("\$200",
                                style:
                                TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.087,
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //                 <--- border radius here
                            )
                          //contentPadding: EdgeInsets.all(20),
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Money Withdraw",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text(
                                        "25th Aug",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 20,),
                                      Text(
                                        "10 AM",
                                        style:
                                        TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),                                child: Text("\$200",
                                style:
                                TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
