import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';
import 'package:havartye/screen/home_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
class TreePage extends StatefulWidget {
  final url;
  const TreePage({Key? key, this.url}) : super(key: key);

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }


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
          title: Text("Tree"),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body:  WebView(
    initialUrl: widget.url,
    javascriptMode: JavascriptMode.unrestricted,

    )

    )
      );

  }
}
