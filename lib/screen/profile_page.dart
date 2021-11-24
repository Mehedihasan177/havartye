import 'package:flutter/material.dart';
import 'package:havartye/daily_commissions.dart';
import 'package:havartye/screen/account.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';
import 'package:havartye/screen/transaction_histoy.dart';
import 'package:havartye/screen/withdraw_history.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Color(0xFF0040A1),
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 23),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomNevigation()));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Row(
                children: [
                  Container(
                    height: 160,
                    width: 130,
                    child: Image(
                      image: AssetImage("assets/profile_image.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 230,
                      child: Column(children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Hulk Rock",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [

                            Text(
                              "Profile ID: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,  fontSize: 12),
                            ),
                            Text(
                              "10112345",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,  fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            Text("Phone Number: "),
                            Text(
                              "0171777777777",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,  fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text("Sponsor: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12),),
                            Text(
                              "Rubel",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,  fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child:  Column(
                        children: [
                          InkWell(
                            onTap: () {}, // Handle your callback.
                            child: Ink(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/total_earn.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "\$50",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "Total Earn",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ],
                      ),
                  ),
                  Expanded(
                    child:  Column(
                      children: [
                        InkWell(
                          onTap: () {}, // Handle your callback.

                          child: Ink(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/withdrawal.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "\$50",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                        Text(
                          "Withdraw Amount",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child:  Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => CommissionPage()));

                          }, // Handle your callback.

                          child: Ink(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                AssetImage("assets/daily_commission.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "\$50",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          "Daily Commission",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.width * 0.15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Account()));
                },
                style: ButtonStyle(
                  // foregroundColor:
                  // MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage("assets/account.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Account',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => WithdrawHistory()));
                },
                style: ButtonStyle(
                  // foregroundColor:
                  // MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage("assets/withdraw_history.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Withdraw History',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => TransactionHistory()));
                },
                style: ButtonStyle(
                  // foregroundColor:
                  // MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage("assets/transaction_history.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Transaction History',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.31,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
                },
                style: ButtonStyle(
                  // foregroundColor:
                  // MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage("assets/currency_change.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Currency Change',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.36,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
                },
                style: ButtonStyle(
                  // foregroundColor:
                  // MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage("assets/t&c.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'T&C',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.59,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
                },
                style: ButtonStyle(
                  // foregroundColor:
                  // MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage("assets/logout.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Log Out',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.53,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
