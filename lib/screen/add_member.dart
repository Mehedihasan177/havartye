import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:havartye/constents/constant.dart';
import 'package:havartye/controllers/create_account_controller.dart';
import 'package:havartye/controllers/district_controller.dart';
import 'package:havartye/controllers/division_controller.dart';
import 'package:havartye/controllers/position_tracking_controller.dart';
import 'package:havartye/controllers/signIn_controller.dart';
import 'package:havartye/helper/alertDialogue.dart';
import 'package:havartye/model/create_account_model.dart';
import 'package:havartye/model/sign_model.dart';
import 'package:havartye/responses/position_tracking_responses.dart';
import 'package:havartye/responses/signIn_responses.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';
import 'package:havartye/screen/dropdown_button_district.dart';
import 'package:havartye/screen/dropdown_button_placement_position.dart';
import 'package:havartye/responses/district_responses.dart' as dist;
import 'package:havartye/responses/division_responses.dart' as div;
import 'package:havartye/screen/home_page.dart';

import 'add_member_successfull.dart';

class AddMember extends StatefulWidget {
  const AddMember({Key? key}) : super(key: key);

  @override
  _AddMemberState createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  TextEditingController _textUsername = TextEditingController();
  TextEditingController _textFullname = TextEditingController();
  TextEditingController _textNID = TextEditingController();
  TextEditingController _textEmail = TextEditingController();
  TextEditingController _textPhonenumber = TextEditingController();
  TextEditingController _textArea = TextEditingController();
  TextEditingController _textPassword = TextEditingController();
  TextEditingController _textTransactionPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }
  District value = district.first;
  PlacementPosition position = placementpositon.first;
  bool checkbox = false;
  TextEditingController _textPosID = TextEditingController();
  TextEditingController _textuserTrackName = TextEditingController();
  int currentPositionID = 0;
  int myCurrentPos = 1;
  String currentMessage = "You are joining at ...";
  late String finalToken;

  late dist.Datum selectedDistricts;
  List<dist.Datum> districtList = [];
  List<dist.Datum> districtListRenewd = [];

  late div.Datum selectedDivision;
  List<div.Datum> divisionList = [];

  fetchDivision() async {
    DivisionController.requestThenResponsePrint().then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listDistrict = decoded['data'];
        //print(decoded['data']);
        divisionList =
            listDistrict.map((model) => div.Datum.fromJson(model)).toList();
        selectedDivision = divisionList[0];

        if (divisionList.length == 0) {
          selectedDivision = div.Datum(name: 'Please Wait', id: 999);
        } else {
          selectedDivision = divisionList[0];
        }
      });
    });
  }

  fetchDistricts() async {
    DistrictController.requestThenResponsePrint().then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listDistrict = decoded['data'];
        //print(decoded['data']);
        districtList =
            listDistrict.map((model) => dist.Datum.fromJson(model)).toList();

        if (districtListRenewd.length == 0) {
          selectedDistricts = dist.Datum(
              id: 999,
              name: 'Please Wait',
              division: 'Select a District',
              divisionId: 999);
        } else {
          selectedDistricts = districtList[0];
        }
      });
    });
  }

  void renewDistrict(div.Datum selectedDivision) {
    districtListRenewd.clear();
    for (var singleDsitIter in districtList) {
      if (singleDsitIter.divisionId == selectedDivision.id) {
        setState(() {
          districtListRenewd.add(singleDsitIter);
          selectedDistricts = districtListRenewd[0];
        });
      }
    }
    if (districtListRenewd.length == 0) {
      selectedDistricts = dist.Datum(
          id: 999,
          name: 'Please Wait',
          division: 'Select a District',
          divisionId: 999);
    }
  }

  _getPositionTrack(int pos) async {
    PositionTrackingController.requestThenResponsePrint(APITOKEN, pos)
        .then((value) {
      print(value.statusCode);
      print(value.statusCode);
      if (value.statusCode == 200) {
        print("successfully done");
        print(value);
        print(value.body);
        PositionTrackingResponse positionTrackingResponse =
            PositionTrackingResponse.fromJson(jsonDecode(value.body));
        setState(() {
          print(positionTrackingResponse);
          print(positionTrackingResponse.data.name);
          _textPosID.text = positionTrackingResponse.data.posId.toString();
          _textuserTrackName.text = positionTrackingResponse.data.userName;
          currentPositionID = positionTrackingResponse.data.posId;
          currentMessage = positionTrackingResponse.msg;
        });
      } else {
        AlertDialogueHelper().showAlertDialog(
            context, 'Warning', 'Please recheck mobile and password');
      }
    });
  }

  @override
  void initState() {
    _getPositionTrack(1);
    fetchDivision();
    selectedDivision = div.Datum(name: 'Please Wait', id: 999);
    fetchDistricts();
    selectedDistricts = dist.Datum(
        id: 999,
        name: 'Please Wait',
        division: 'Select a District',
        divisionId: 999);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///division items
    List<DropdownMenuItem> divistionItems = divisionList.map((divisionItem) {
      return DropdownMenuItem<div.Datum>(
        child: Text(divisionItem.name),
        value: divisionItem,
      );
    }).toList();

    // if list is empty, create a dummy item
    if (divistionItems.isEmpty) {
      divistionItems = [
        DropdownMenuItem(
          child: Text(selectedDivision.name),
          value: selectedDivision,
        )
      ];
    }

    ///division items

    ///district items
    List<DropdownMenuItem> districtItems =
        districtListRenewd.map((districtItem) {
      return DropdownMenuItem<dist.Datum>(
        child: Text(districtItem.name),
        value: districtItem,
      );
    }).toList();

    // if list is empty, create a dummy item
    if (districtItems.isEmpty) {
      districtItems = [
        DropdownMenuItem(
          child: Text(selectedDistricts.name),
          value: selectedDistricts,
        )
      ];
    }

    ///district items

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create a Member"),
        ),
        body: Center(
          child: Container(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      //Username
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
                                  "Name",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35, right: 35),
                            child: TextField(
                              controller: _textUsername,
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black),
                              //scrollPadding: EdgeInsets.all(10),
                              decoration: InputDecoration(
                                //contentPadding: EdgeInsets.all(20),
                                hintText: "Enter your name",
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      //username
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
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
                              controller: _textFullname,
                              keyboardType: TextInputType.text,
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
                        height: 20,
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
                                  child: Image(
                                    image: AssetImage("assets/nid.png"),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 35, right: 35),
                            child: TextField(
                              controller: _textNID,
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black),
                              //scrollPadding: EdgeInsets.all(10),
                              decoration: InputDecoration(
                                //contentPadding: EdgeInsets.all(20),
                                hintText: "Enter your NID",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 35, right: 35),
                            child: TextField(
                              controller: _textEmail,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black),
                              //scrollPadding: EdgeInsets.all(10),
                              decoration: InputDecoration(
                                //contentPadding: EdgeInsets.all(20),
                                hintText: "Enter your email",
                              ),
                            ),
                          )
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
                                  child: Image(
                                    image: AssetImage("assets/number1.png"),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 35, right: 35),
                            child: TextField(
                              controller: _textPhonenumber,
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
                      //             child: Image(
                      //               image:
                      //                   AssetImage("assets/placement_id.png"),
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
                      //     // Container(
                      //     //   height: MediaQuery.of(context).size.height * 0.08,
                      //     //   width: MediaQuery.of(context).size.width * 0.80,
                      //     //   decoration: BoxDecoration(
                      //     //     color: Colors.white,
                      //     //     borderRadius: BorderRadius.circular(18),
                      //     //   ),
                      //     //   child: TextField(
                      //     //     controller: _textposid,
                      //     //     obscureText: true,
                      //     //     //keyboardType: TextInputType.text,
                      //     //     style: TextStyle(color: Colors.black),
                      //     //     //scrollPadding: EdgeInsets.all(10),
                      //     //     decoration: InputDecoration(
                      //     //       //contentPadding: EdgeInsets.all(20),
                      //     //       hintText: "Enter your placement id",
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 10,
                      ),

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
                                  child: Image(
                                    image:
                                        AssetImage("assets/placement_id.png"),
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
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                              // alignment: Alignment.center,
                              // height:
                              //     MediaQuery.of(context).size.height * 0.067,
                              width: MediaQuery.of(context).size.width * 0.87,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton<PlacementPosition>(
                                isExpanded: true,
                                value: position, // currently selected item
                                items: placementpositon
                                    .map((item) =>
                                        DropdownMenuItem<PlacementPosition>(
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 8),
                                              Text(
                                                item.title,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          value: item,
                                        ))
                                    .toList(),
                                onChanged: (value) => setState(() {
                                  this.position = value!;
                                  print(this.position.title);
                                  print(this.position.posID);
                                  myCurrentPos = this.position.posID;
                                  _getPositionTrack(position.posID);
                                }),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 37, top: 13),
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(position.posID.toString())),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
                                child: Divider(
                                  height: 2,
                                  thickness: 1,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 35, right: 35),
                          //   child: TextField(
                          //       controller: _textPosID,
                          //       keyboardType: TextInputType.text,
                          //       style: TextStyle(color: Colors.black),
                          //       enabled: false,
                          //       //scrollPadding: EdgeInsets.all(10),
                          //       decoration: InputDecoration(
                          //         //contentPadding: EdgeInsets.all(20),
                          //         hintText: "Your position id",
                          //       ),
                          //     ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35, right: 35),
                            child: TextField(
                              controller: _textuserTrackName,
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black),
                              enabled: false,
                              //scrollPadding: EdgeInsets.all(10),
                              decoration: InputDecoration(
                                //contentPadding: EdgeInsets.all(20),
                                hintText: "Sponsor username",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(currentMessage),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //District
                      Center(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 16, bottom: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 17,
                                    width: 17,
                                    child: Image(
                                      image: AssetImage("assets/area.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Select Division",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 10),
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.87,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton<dynamic>(
                                items: divistionItems,
                                onChanged: (newValDiv) {
                                  print(newValDiv);
                                  if (newValDiv.id != 999)
                                    setState(() {
                                      selectedDivision = newValDiv;
                                      renewDistrict(selectedDivision);
                                    });
                                },
                                value: selectedDivision,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                  left: 16, bottom: 10, top: 20),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 17,
                                    width: 17,
                                    child: Image(
                                      image: AssetImage("assets/area.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Select District",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 10),
                                height:
                                    MediaQuery.of(context).size.width * 0.12,
                                width: MediaQuery.of(context).size.width * 0.87,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButton<dynamic>(
                                  items: districtItems,
                                  onChanged: (newValDist) {
                                    print(newValDist);
                                    if (newValDist.id != 999)
                                      setState(
                                          () => selectedDistricts = newValDist);
                                  },
                                  value: selectedDistricts,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //Area
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
                      //             child: Image(
                      //               image: AssetImage("assets/region.png"),
                      //               fit: BoxFit.cover,
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Text(
                      //             "Area",
                      //             style: TextStyle(fontSize: 17),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 35, right: 35, top: 5),
                      //       child: TextField(
                      //           controller: _textArea,
                      //           keyboardType: TextInputType.text,
                      //           style: TextStyle(color: Colors.black),
                      //           //scrollPadding: EdgeInsets.all(10),
                      //           decoration: InputDecoration(
                      //             //contentPadding: EdgeInsets.all(20),
                      //             hintText: "Enter your area",
                      //           ),
                      //         ),
                      //     ),
                      //
                      //   ],
                      // ),
                      SizedBox(
                        height: 20,
                      ),

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
                                  child: Image(
                                    image: AssetImage("assets/password.png"),
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
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35, right: 35),
                            child: TextField(
                              controller: _textPassword,
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.077,
                    width: MediaQuery.of(context).size.width * 0.95,
                    //color: Color(0xF60D72),
                    child: ElevatedButton(
                      child: Text(
                        "Create Account",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => _addmember(_textUsername, _textFullname,
                          _textPhonenumber, _textNID, _textEmail, _textPosID, myCurrentPos,
                        selectedDivision.id, selectedDistricts.id, _textArea, _textPassword, context),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF1A150D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        //color: Color(0xF60D72),
                        borderRadius: BorderRadius.circular(18)),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInAgain(BuildContext context) async {
    EasyLoading.show(status: 'loading...');

    SignInModel myInfo = new SignInModel(password: USERPASS, name: USERNAME);
    await SigninController.requestThenResponsePrint(myInfo).then((value) async {
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
          MaterialPageRoute(builder: (context) => AddMember()),
        );
      } else {
        // return LoginController.requestThenResponsePrint(jsonData);
        AlertDialogueHelper().showAlertDialog(
            context, 'Warning', 'Please recheck email and password');
      }
    });
  }
  _addmember(TextEditingController textUsername, TextEditingController textFullname, TextEditingController textPhonenumber,
      TextEditingController textNID, TextEditingController textEmail, TextEditingController textPosID,
      int myCurrentPos, int id, int id2, TextEditingController textArea, TextEditingController textPassword,
      BuildContext context) async {
    String _password = textPassword.text.trim();
    String _phone_number = textPhonenumber.text.trim();
    print("token of user\n");
    print("token at call mehedi hasan who are you: " +
        APITOKEN);





    if (_password.length < 6) {
      AlertDialogueHelper().showAlertDialog(
          context, 'Warning', 'Minimum password length need to 6');
    }

    else if (_textUsername.text.length < 1) {
      AlertDialogueHelper().showAlertDialog(
          context, 'Warning', 'Please Enter a valid Username');
    }
    else if (_textUsername.text.contains(' ')) {
      AlertDialogueHelper().showAlertDialog(
          context, 'Warning', 'Please Enter a valid Username without Space');
    }
    else if (_phone_number.length != 11) {
      AlertDialogueHelper().showAlertDialog(
          context, 'Warning', 'Phone number is less or more than 11');
    }
    else if (!(RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(_textEmail.text))) {
      AlertDialogueHelper().showAlertDialog(
          context, 'Warning', 'Please Enter a Valid Email');
    }
    else if (id==999) {
      AlertDialogueHelper().showAlertDialog(
          context, 'Warning', 'Please Select a Valid Division');
    }
    else if (id2==999) {
      AlertDialogueHelper().showAlertDialog(
          context, 'Warning', 'Please Select a Valid District in your Division');
    }
    else {


      if (true) {
      CreateAccountModel passChange = new CreateAccountModel(
        name: textUsername.text,
        user_name: textFullname.text,
        phone: textPhonenumber.text,
        nid_number: textNID.text,
        email: textEmail.text,
        pos_id: textPosID.text,
        position: myCurrentPos.toString(),
        division_id: id,
        district_id: id2,
        area: textArea.text,
        password: textPassword.text,
      );


      CreateAccountController.requestThenResponsePrint(
          APITOKEN, passChange)
          .then((value) {
        print(value.statusCode);
        print(value.body);
        if (value.statusCode == 200) {
          print("successfully done");
          AlertDialogueHelper().showAlertDialog(
              context,
              'Congratulation',
              'Successfully account created');
          signInAgain(context);
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => RegistrationSuccessfull()));


        } else {
          AlertDialogueHelper().showAlertDialog(
              context, 'Warning',
              value.body
                  .replaceAll('"', ' ')
                  .replaceAll('{', ' ')
                  .replaceAll('}', ' ')
                  .replaceAll('[', ' ')
                  .replaceAll(']', ' ')
          );
        }
      });
    }
      else{
        AlertDialogueHelper().showAlertDialog(
            context, 'Warning',
            "fuck yourself"


        );
      }
    }

  }
}


// Color(0xFF0040A1),
