import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:havartye/screen/splash_Screen.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:io';

void main() async{
  //WidgetsFlutterBinding.ensureInitialized();
  // if (Platform.isAndroid) {
  //   await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  // }
  //GestureBinding.instance?.resamplingEnabled = true;
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<NavigatorState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
      home: WillPopScope(

        onWillPop: () async {
          if (_key.currentState!.canPop()) {
            _key.currentState!.pop();
            return false;
          }
          return true;
        },
        child: Scaffold(
          body: SplashScreen(),

        ),
      )
    );
  }
}
