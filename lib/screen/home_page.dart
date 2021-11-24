import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:havartye/constents/constant.dart';
import 'package:havartye/controllers/ad_view_controller.dart';
import 'package:havartye/controllers/all_packages_controller.dart';
import 'package:havartye/controllers/buy_package_controller.dart';
import 'package:havartye/controllers/current_packages_controller.dart'as currentPackage;
import 'package:havartye/controllers/current_packages_controller.dart';
import 'package:havartye/helper/alertDialogue.dart';
import 'package:havartye/model/buy_package_model.dart';
import 'package:havartye/responses/ad_view_responses.dart';
import 'package:havartye/responses/all_packages_responses.dart';
import 'package:havartye/responses/current_packages_responses.dart' as currentPackage;
import 'package:havartye/screen/add_member.dart';
import 'package:havartye/screen/product_packages_page.dart';
import 'package:havartye/screen/tasks_pages.dart';
import 'package:havartye/screen/transfer_money.dart';
import 'package:havartye/screen/tree.dart';
import 'package:havartye/screen/upcomming_page.dart';
import 'package:havartye/screen/withdraw_money.dart';
import 'package:url_launcher/link.dart';

import 'ad_viewUI.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String finalToken;

  List<Datum> allPackages = [];
 // List<currentPackage.Data> recentPackages = [];

  int  id = 0;
  String Name = "Package";
  String AdLimit = "";
  String type = "";
  String amount = "";
  String dailyBonus = "";

  _getCurrentPackage() async {
    CurrentPackagesController.requestThenResponsePrint(APITOKEN).then((value) {

      print(value.statusCode);
      print(value.statusCode);
      if (value.statusCode == 200) {
        print("successfully done");
        print(value);
        print(value.body);

        currentPackage.Data current = currentPackage.Data.fromJson(jsonDecode(value.body.toString()));
        print(current);
        print(current.amount);
        Name = current.name;
        amount = current.amount;
        dailyBonus = current.dailyBonus;
        AdLimit = current.adLimit;


      }else{
        AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Please recheck mobile and password');
      }
    }
    );


  }

  _getAllpackages() async {
    // setState(() {
    //   finalToken = catchtoken!;
    // });
    // print(finalToken);
    // print(finalToken);

    AllPackagesController.requestThenResponsePrint(APITOKEN).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listholiday = decoded['data'];
        print(decoded['data']);
        allPackages =
            listholiday.map((model) => Datum.fromJson(model)).toList();
        print(allPackages);

      });
    });
  }

  
  @override
  void initState() {
    _getAllpackages();
    _getCurrentPackage();
    print("APITOKEN");
    print(APITOKEN);
    print('SIGNINRESPONSE.data.leftUsers');
    print(SIGNINRESPONSE.data.leftUsers);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    allPackages = allPackages.reversed.toList();
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                color: Color(0xFF0040A1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Hello, ${SIGNINRESPONSE.data.name}",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdViewUI()),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,

                                    child: Image(
                                      image: AssetImage("assets/cable-tv.png",),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text("Tv Channel",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    SIGNINRESPONSE.data.leftUsers.toString(),
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                  Text(
                                    "Left count",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    (SIGNINRESPONSE.data.leftUsers+SIGNINRESPONSE.data.rightUsers).toString(),
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                  Text(
                                    "Total count",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    SIGNINRESPONSE.data.rightUsers.toString(),
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                  Text(
                                    "Right Count",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 20),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "My Wallets",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30.0),
                    padding: EdgeInsets.only(left: 20),
                    height: 80.0,
                    child: Row(
                      // This next line does the trick.
                      //scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                    image: AssetImage("assets/rent.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Cash",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF13BF6D))),
                                Text(SIGNINRESPONSE.data.cash.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF13BF6D))),
                              ],
                            ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                child: Image(
                                  image: AssetImage("assets/rent.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Outsourcing",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0040A1))),
                              Text(SIGNINRESPONSE.data.outsourcing.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0040A1))),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                child: Image(
                                  image: AssetImage("assets/rent.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Shopping",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFD428AB))),
                              Text(SIGNINRESPONSE.data.shopping.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFD428AB))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xFF0040A1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HotelBooking()));
                              }, // Handle your callback.

                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/hotel-booking.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Hotel Booking",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HotelBooking()));
                              }, // Handle your callback.
                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/catering.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Catering",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HotelBooking()));
                              }, // Handle your callback.

                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage("assets/rent-a-car.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Rent a Car",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {}, // Handle your callback.

                              child: Ink(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/ride_share.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Ride & Share",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HotelBooking()));
                              }, // Handle your callback.

                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/tour_travels.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Tour & Travels",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HotelBooking()));
                              }, // Handle your callback.
                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/tracking.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Tracking",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HotelBooking()));
                              }, // Handle your callback.

                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage("assets/beauty_&_salon.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Beauty and Salon",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HotelBooking()));
                              }, // Handle your callback.

                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/servicing.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Servicing",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HotelBooking()));
                              }, // Handle your callback.

                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/passport.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Passport",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddMember()));
                              }, // Handle your callback.
                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/add_member.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Add Member",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WithdrawMoney()));
                              }, // Handle your callback.

                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage("assets/cashwithdrawal.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Withdraw",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {}, // Handle your callback.

                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/task-list.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Income",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TransferMoney()));
                              }, // Handle your callback.

                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/send-money.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Transfer",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {}, // Handle your callback.

                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage("assets/receive-amount.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Received",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {}, // Handle your callback.

                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage("assets/online-shopping.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Shop",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HotelBooking()));
                              }, // Handle your callback.

                              child: Ink(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/it_solution.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "IT Solution",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Active Packages",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(

                        height: 150,
                        width: 275,

                        child: Card(
                          elevation: 2,
                          color: Color(0xFF4F45A1),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, ),
                            child: Column(
                              //scrollDirection: Axis.vertical,
                              children: [
                                Text(
                                 Name,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                                Text(
                                  "\$" + amount.toString(),
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Daily Bounus \$" + dailyBonus.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                    "Ad Limitation " + AdLimit.toString() + " days ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Product Packages",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: allPackages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return allPackages[index].type.toLowerCase()=='product'.toLowerCase()?buildAllPackagesTile(allPackages[index]):Container();

                        }
                    ),
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Outsourcing Packages",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: allPackages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return allPackages[index].type.toLowerCase()=='outsourcing'.toLowerCase()?buildAllPackagesTile(allPackages[index]):Container();

                        }
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Investment Packages",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: allPackages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return allPackages[index].type.toLowerCase()=='investment'.toLowerCase()?buildAllPackagesTile(allPackages[index]):Container();

                        }
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget buildAllPackagesTile(Datum allPackag) =>
      SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: 276,
              child: Card(
                color: Color(0xFF4F45A1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [

                      Text(
                        allPackag.name,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      Text(
                        "\$" + allPackag.amount.toString(),
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Daily Bounus \$" + allPackag.dailyBonus.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Ad Limitation " + allPackag.adLimit.toString() + "days",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 250, top: 50),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(40))),
                child: ClipOval(
                  child: Material(
                    color: Color(0xFF0040A1), // Button color
                    child: InkWell(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(allPackag.name),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Do you want to buy ' + allPackag.name + ' package'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Buy'),
                                  onPressed: () {
                                    print("token of user\n");
                                    print("token at call mehedi hasan who are you: " + APITOKEN);

                                    BuyPackageController.requestThenResponsePrint(APITOKEN, id).then((value) {

                                      print(value.statusCode);
                                      print(value.body);
                                      if (value.statusCode == 200) {
                                        print("successfully done");
                                      }

                                      else if(value.statusCode == 404){
                                        AlertDialogueHelper().showAlertDialog(context, 'Warning', 'You have already buy a package');
                                      }

                                      else{
                                        AlertDialogueHelper().showAlertDialog(context, 'Warning', 'May be their have problems');
                                      }
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        child: Center(
                          child: Container(
                              height: 30,
                              width: 30,
                              child: Icon(Icons.arrow_forward_ios_sharp,
                                color: Colors.white,
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

Widget buildCurrentPackagesTile(currentPackage.Data currentPackageResponses) =>
    SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: 276,
            child: Card(
              color: Color(0xFF4F45A1),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [

                    Text(
                      currentPackageResponses.name,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Text(
                      "\$" + currentPackageResponses.amount.toString(),
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Daily Bounus \$" + currentPackageResponses.dailyBonus.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Ad Limitation " + currentPackageResponses.adLimit.toString() + "days",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );


