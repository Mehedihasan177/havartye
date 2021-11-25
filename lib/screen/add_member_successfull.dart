import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:havartye/screen/add_member.dart';

class RegistrationSuccessfull extends StatelessWidget {
  const RegistrationSuccessfull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AddMember()));
        return true;
      },
      child: Scaffold(
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
                            MaterialPageRoute(builder: (context) => AddMember()));
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Member Added Successfully",
                      style: TextStyle(
                          fontSize: 28,
                          color: Color(0xFF0040A1),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Image(
                  image: AssetImage("assets/successfull.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Congratulations",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "New Member registration has been successful",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0040A1)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
