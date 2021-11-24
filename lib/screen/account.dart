import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';
import 'package:havartye/screen/profile_page.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

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
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
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
                        TextField(
                          controller: _textEmail,
                          enabled: false,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black),
                          //scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.all(20),
                            hintText: "Enter your username",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //fullname
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person,
                              size: 18,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Full Name",
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
                        child: TextField(
                          controller: _textPassword,
                          obscureText: true,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black),
                          //scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.all(20),
                            hintText: "Enter your full name",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //NID
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
                              child: Image(image: AssetImage("assets/nid.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "NID",
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
                        child: TextField(
                          controller: _textPassword,
                          obscureText: true,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black),
                          //scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.all(20),
                            hintText: "Enter your NID number",

                          ),
                        ),
                      ),
                    ],
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
                        child: TextField(
                          controller: _textPassword,
                          obscureText: true,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black),
                          //scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.all(20),
                            hintText: "Enter your email",
                          ),
                        ),
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
                        child: TextField(
                          controller: _textPassword,
                          obscureText: true,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black),
                          //scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.all(20),
                            hintText: "Enter your phone number",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // //Sponsor
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
                  //             child: Image(image: AssetImage("assets/sponsor.png"),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 20,
                  //           ),
                  //           Text(
                  //             "Sponsor",
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
                  //           hintText: "Enter your sponsor",
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),

                  //Placement ID
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
                  //             child: Image(image: AssetImage("assets/placement_id.png"),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 20,
                  //           ),
                  //           Text(
                  //             "Placement ID",
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
                  //           hintText: "Enter your placement id",
                  //
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),

                  //Placement position
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
                              child: Image(image: AssetImage("assets/placement_id.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Placement Position",
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
                        child: TextField(
                          controller: _textPassword,
                          obscureText: true,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black),
                          //scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.all(20),
                            hintText: "Enter your password",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // //Country
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
                  //             child: Image(image: AssetImage("assets/global.png"),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 20,
                  //           ),
                  //           Text(
                  //             "Country",
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
                  //           hintText: "Enter your Country",
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),

                  //District
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
                        child: TextField(
                          controller: _textPassword,
                          obscureText: true,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black),
                          //scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.all(20),
                            hintText: "Enter your district",
                          ),
                        ),
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
                        child: TextField(
                          controller: _textPassword,
                          obscureText: true,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black),
                          //scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.all(20),
                            hintText: "Enter your area",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // //Gender
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
                  //             child: Image(image: AssetImage("assets/gender.png"),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 20,
                  //           ),
                  //           Text(
                  //             "Gender",
                  //             style: TextStyle(fontSize: 17),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(height: 10,),
                  //     Row(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 20),
                  //           child: Row(
                  //             children: [
                  //               Checkbox(
                  //                 value: checkbox,
                  //                 shape: CircleBorder(),
                  //                 onChanged: (bool? value) {
                  //                   setState(() {
                  //                     checkbox = value!;
                  //                   });
                  //                 },
                  //               ),
                  //               // SizedBox(width: 20,),
                  //               Text("Male", style: TextStyle(fontSize: 15),),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 20),
                  //           child: Row(
                  //             children: [
                  //               Checkbox(
                  //                 value: checkbox,
                  //                 shape: CircleBorder(),
                  //                 onChanged: (bool? value) {
                  //                   setState(() {
                  //                     checkbox = value!;
                  //                   });
                  //                 },
                  //               ),
                  //               // SizedBox(width: 10,),
                  //               Text("Female", style: TextStyle(fontSize: 15),),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  //
                  // SizedBox(height: 15,),

                  //Password
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
                              child: Image(image: AssetImage("assets/password.png"),
                                fit: BoxFit.cover,
                              ),
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
                        child: TextField(
                          controller: _textPassword,
                          obscureText: true,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black),
                          //scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.all(20),
                            hintText: "Enter your password",

                          ),
                        ),
                      ),
                    ],
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
