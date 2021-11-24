import 'package:flutter/material.dart';
import 'package:havartye/screen/profile_page.dart';

class CommissionPage extends StatefulWidget {
  const CommissionPage({Key? key}) : super(key: key);

  @override
  _CommissionPageState createState() => _CommissionPageState();
}

class _CommissionPageState extends State<CommissionPage> {
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
          title: Text("Commissions"),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30.0),
              padding: EdgeInsets.only(left: 20),
              height: 80.0,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    // height: 30,
                    width: 65,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [

                            Text("Spot",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF13BF6D))),
                            Text("50.55234",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF13BF6D))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    //height: 50,
                    width: 65,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("Matching",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFA32391))),
                            Text("50.55234",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFA32391))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    //height: 50,
                    width: 65,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [

                            Text("Carry",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0040A1))),
                            Text("50.55234",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0040A1))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    //height: 50,
                    width: 65,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("Total",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFE11C1C))),
                            Text("50.55234",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFE11C1C))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Center(
              child: Image(
                image: AssetImage("assets/treeImage.png"),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
