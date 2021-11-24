import 'package:flutter/material.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';

class HotelBooking extends StatefulWidget {
  const HotelBooking({Key? key}) : super(key: key);

  @override
  _HotelBookingState createState() => _HotelBookingState();
}

class _HotelBookingState extends State<HotelBooking> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Text(
            "Comming Soon",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
