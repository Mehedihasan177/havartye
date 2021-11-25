import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:havartye/responses/profile_responses.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';
import 'package:havartye/screen/profile_page.dart';

class Account extends StatefulWidget {
  final Data ProfData;
  const Account({Key? key, required  this.ProfData}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  TextEditingController _textEmail = TextEditingController();
  TextEditingController _textPassword = TextEditingController();
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),

        body: ListView(
          children: [
            Container(
              height: 60,
              // color: Color(0xFF0040A1),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => ProfilePage()));
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      "Account",
                      style: TextStyle(fontSize: 28, color: Color(0xFF0040A1),fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),



            SizedBox(height: 40,),

            Container(
              child: Column(
                children: [
                  //username
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person,
                              size: 18,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Username",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10, bottom: 5),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(widget.ProfData.name)),
                        ),
                        const Divider(
                          thickness: 1, // thickness of the line
                          indent: 5, // empty space to the leading edge of divider.
                          endIndent: 5, // empty space to the trailing edge of the divider.
                          color: Colors.black, // The color to use when painting the line.
                          height: 5, // The divider's height extent.
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //Email
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 18,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 5),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(widget.ProfData.email)),
                            ),
                            const Divider(
                              thickness: 1, // thickness of the line
                              indent: 5, // empty space to the leading edge of divider.
                              endIndent: 5, // empty space to the trailing edge of the divider.
                              color: Colors.black, // The color to use when painting the line.
                              height: 5, // The divider's height extent.
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //Phone number
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 17,
                              width: 17,
                              child: Image(image: AssetImage("assets/number1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Phone Number",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 5),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(widget.ProfData.phone)),
                            ),
                            const Divider(
                              thickness: 1, // thickness of the line
                              indent: 5, // empty space to the leading edge of divider.
                              endIndent: 5, // empty space to the trailing edge of the divider.
                              color: Colors.black, // The color to use when painting the line.
                              height: 5, // The divider's height extent.
                            ),
                          ],
                        )
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 17,
                              width: 17,
                              child: Image(image: AssetImage("assets/area.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "District",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20, left: 10, bottom: 5),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(widget.ProfData.district)),
                              ),
                              const Divider(
                                thickness: 1, // thickness of the line
                                indent: 5, // empty space to the leading edge of divider.
                                endIndent: 5, // empty space to the trailing edge of the divider.
                                color: Colors.black, // The color to use when painting the line.
                                height: 5, // The divider's height extent.
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Area
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 17,
                              width: 17,
                              child: Image(image: AssetImage("assets/region.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Area",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20, left: 10, bottom: 5),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(widget.ProfData.area)),
                              ),
                              const Divider(
                                thickness: 1, // thickness of the line
                                indent: 5, // empty space to the leading edge of divider.
                                endIndent: 5, // empty space to the trailing edge of the divider.
                                color: Colors.black, // The color to use when painting the line.
                                height: 5, // The divider's height extent.
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 17,
                              width: 17,
                              child: Image(image: AssetImage("assets/packages1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Package Name",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 5),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(widget.ProfData.packageName)),
                            ),
                            const Divider(
                              thickness: 1, // thickness of the line
                              indent: 5, // empty space to the leading edge of divider.
                              endIndent: 5, // empty space to the trailing edge of the divider.
                              color: Colors.black, // The color to use when painting the line.
                              height: 5, // The divider's height extent.
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 17,
                              width: 17,
                              child: Image(image: AssetImage("assets/boxes1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Type",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 5),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(widget.ProfData.type)),
                            ),
                            const Divider(
                              thickness: 1, // thickness of the line
                              indent: 5, // empty space to the leading edge of divider.
                              endIndent: 5, // empty space to the trailing edge of the divider.
                              color: Colors.black, // The color to use when painting the line.
                              height: 5, // The divider's height extent.
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),





                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 17,
                              width: 17,
                              child: Image(image: AssetImage("assets/ranking1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Rank",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 5),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(widget.ProfData.rank)),
                            ),
                            const Divider(
                              thickness: 1, // thickness of the line
                              indent: 5, // empty space to the leading edge of divider.
                              endIndent: 5, // empty space to the trailing edge of the divider.
                              color: Colors.black, // The color to use when painting the line.
                              height: 5, // The divider's height extent.
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 17,
                              width: 17,
                              child: Icon(
                                Icons.app_blocking,
                                color: Colors.black.withOpacity(0.4),
                              )
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20, left: 10, bottom: 5),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(widget.ProfData.password)),
                              ),
                              const Divider(
                                thickness: 1, // thickness of the line
                                indent: 5, // empty space to the leading edge of divider.
                                endIndent: 5, // empty space to the trailing edge of the divider.
                                color: Colors.black, // The color to use when painting the line.
                                height: 5, // The divider's height extent.
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Transactin Password
                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 33),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Container(
                  //             height: 17,
                  //             width: 17,
                  //             child: Image(image: AssetImage("assets/password.png"),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 20,
                  //           ),
                  //           Text(
                  //             "Transaction Password",
                  //             style: TextStyle(fontSize: 17),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Container(
                  //       height: MediaQuery.of(context).size.height * 0.08,
                  //       width: MediaQuery.of(context).size.width * 0.80,
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(18),
                  //       ),
                  //       child: TextField(
                  //         controller: _textPassword,
                  //         obscureText: true,
                  //         keyboardType: TextInputType.text,
                  //         style: TextStyle(color: Colors.black),
                  //         //scrollPadding: EdgeInsets.all(10),
                  //         decoration: InputDecoration(
                  //           //contentPadding: EdgeInsets.all(20),
                  //           hintText: "Enter your Transaction Password",
                  //
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Center(
            //   child: Container(
            //     height: MediaQuery.of(context).size.height * 0.077,
            //     width: MediaQuery.of(context).size.width * 0.95,
            //     //color: Color(0xF60D72),
            //     child: ElevatedButton(
            //       child: Text(
            //         "Registration",
            //         style: TextStyle(color: Colors.white, fontSize: 20),
            //       ),
            //       onPressed: () async {
            //         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
            //
            //       },
            //       style: ElevatedButton.styleFrom(
            //         primary: Color(0xFF0040A1),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(18)),
            //       ),
            //     ),
            //     decoration: BoxDecoration(
            //       //color: Color(0xF60D72),
            //         borderRadius: BorderRadius.circular(18)),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // )
          ]
        ),
      ),
    );
  }
}
