import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:havartye/constents/constant.dart';
import 'package:havartye/controllers/profile_controller.dart';
import 'package:havartye/daily_commissions.dart';
import 'package:havartye/helper/alertDialogue.dart';
import 'package:havartye/responses/profile_responses.dart';
import 'package:havartye/screen/account.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';
import 'package:havartye/screen/splash_Screen.dart';
import 'package:havartye/screen/transaction_histoy.dart';
import 'package:havartye/screen/tree.dart';
import 'package:havartye/screen/withdraw_history.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {





  Data profData = new Data( name: 'name', email: 'email', phone: 'phone',
     district: 'district', area: 'area',
      image: 'image', type: 'type', rank: '999',
      withdrawAmount: "999",
      dailyAddLimit: "999", investAmount: "999", dailyCommission: "999", totalEarn: "999"
  );


  _getProfile() async {


    ProfileController.requestThenResponsePrint(APITOKEN).then((value) {

      print(value.statusCode);
      print(value.statusCode);
      if (value.statusCode == 200) {


        setState(() {
          ProfileController.requestThenResponsePrint(APITOKEN).then((value) {

            print(value.statusCode);
            print(value.statusCode);
            if (value.statusCode == 200) {
              setState(() {
                print("successfully done");
                print(value);
                print(value.body);
                ProfileResponse profiledata = ProfileResponse.fromJson(jsonDecode(value.body.toString()));
                profData = profiledata.data;
                print(profiledata);
                print(profiledata.data.name);
                print(profiledata.data.email);
              });

            }else{
              AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Please recheck mobile and password');
            }
          }
          );
        });
      }else{
        AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Please recheck mobile and password');
      }
    }
    );
  }

  @override
  void initState() {
    _getProfile();
    super.initState();
  }


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
            // Text(profData.name),
            // Text(profData.email),
            // Text(profData.phone),
            // Text(profData.packageValidity),
            // Text(profData.packageName),
            // Text(profData.district),
            // Text(profData.area),
            // Text(profData.image),
            // Text(profData.type),
            // Text(profData.rank),
            // Text(profData.cash.toString()),
            // Text(profData.outsourcing.toString()),
            // Text(profData.purchase.toString()),
            // Text(profData.investment.toString()),
            // Text(profData.dailyAddLimit.toString()),
            // Text(profData.shopping.toString()),
            // Text(profData.withdrawAmount.toString()),
            // Text(profData.dailyAddLimit.toString()),
            // Text(profData.dailyBonus.toString()),
            // Text(profData.leftUsers.toString()),
            // Text(profData.rightUsers.toString()),
            // Text(profData.leftCarry.toString()),
            // Text(profData.rightCarry.toString()),
            // Text(profData.password.toString()),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Row(
                children: [
                  Container(
                    height: 160,
                    width: 130,
                    child: Image(
                      image: AssetImage(profData.image),
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
                              profData.name,
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
                            Text("Email: "),
                            Text(
                              profData.email,
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
                              profData.phone,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,  fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Row(
                        //   children: [
                        //     Text("Area: ",
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 12),),
                        //     // Text(
                        //     //   profData.area,
                        //     //   style: TextStyle(
                        //     //       color: Colors.black,
                        //     //       fontWeight: FontWeight.bold,  fontSize: 12),
                        //     // ),
                        //   ],
                        // ),
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
                            "\৳" + profData.totalEarn.toString(),
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
                          "\৳" + profData.withdrawAmount.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
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
                          "\৳" + profData.dailyCommission.toString(),

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
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Account(ProfData: profData)));
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
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 12),
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black54,
                        ),
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
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 12),
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black54,
                        ),
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
                  Navigator.push(context,MaterialPageRoute(builder: (context) => TransactionHistory(toShowData: 'all',)));
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
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 12),
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black54,
                        ),
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
                onPressed: () => _launchURL(context),
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
                        image: AssetImage("assets/tree.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Tree',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 12),
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black54,
                        ),
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
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 12),
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black54,
                        ),
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
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SplashScreen()));
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
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 12),
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void _launchURL(BuildContext context) async {
    try {
      await launch(
        'http://admin.havartye.com/tree/$USERNAME',
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Theme.of(context).primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }

}
