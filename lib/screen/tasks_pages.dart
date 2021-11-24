import 'package:flutter/material.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';
import 'package:havartye/screen/home_page.dart';

class TaskPages extends StatefulWidget {
  const TaskPages({Key? key}) : super(key: key);

  @override
  _TaskPagesState createState() => _TaskPagesState();
}

class _TaskPagesState extends State<TaskPages> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0040A1),
          title: Text("Daily Packages"),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),

        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Image(
                    image: AssetImage("assets/task_imageone.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),

            Center(
              child: Text("https://www.youtube.com/watch?v=xxaPToXGAlw",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Image(
                  image: AssetImage("assets/youtube.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
