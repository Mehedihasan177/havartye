import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:havartye/constents/constant.dart';
import 'package:havartye/controllers/ad_count_controller.dart';
import 'package:havartye/controllers/ad_view_controller.dart';
import 'package:havartye/controllers/signIn_controller.dart';
import 'package:havartye/helper/alertDialogue.dart';
import 'package:havartye/model/sign_model.dart';
import 'package:havartye/responses/ad_view_responses.dart';
import 'package:havartye/responses/signIn_responses.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bottomnevigation/bottomnevigation.dart';


class AdViewUI extends StatefulWidget {
  const AdViewUI({Key? key}) : super(key: key);

  @override
  _AdViewUIState createState() => _AdViewUIState();
}

class _AdViewUIState extends State<AdViewUI> {

  late AdViewResponse adViewResponse;
  String imageUrl = 'https://www.encodedna.com/images/theme/easy-image-resizer.jpg';
  String link = 'https://www.youtube.com/watch?v=hkykDj2DdhI&list=RDhkykDj2DdhI&start_radio=1';
  String title = 'title';




  _getAdView() async {
    AdViewController.requestThenResponsePrint(APITOKEN).then((value) {
      setState(() {
        print(value.statusCode);
        print(value.body);
        if(value.statusCode==200){
          AdViewResponse adViewResponse = AdViewResponse.fromJson(jsonDecode(value.body));
          setState(() {
            imageUrl = adViewResponse.adViewResponsess.image;
            link = adViewResponse.adViewResponsess.link;
            title = adViewResponse.adViewResponsess.name;
          });
          print(adViewResponse.adViewResponsess.image);
        }


      });
    });
  }

  bool toShowAvail=false;

  @override
  void initState() {
    _getAdView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Havartye'),),
      body: Container(
        child: ListView(
          children: [
            Image.network(imageUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,style: TextStyle(fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text(link,style: TextStyle(color: Colors.blue,fontStyle: FontStyle.italic),),
                onTap: (){
                  _launchURL();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(child: Center(
                  child: Container(
                    width: 100,
                    child: FlatButton(onPressed: () {
                      setState(() {
                        _launchURL();
                        toShowAvail=true;
                      });
                    },
                      child: Text('Visit',style: TextStyle(color: Colors.white),),
                      color: Colors.green,
                    ),
                  ),
                ),
                visible: !toShowAvail,
                ),
                // SizedBox(width: 10,),
                Visibility(
                  child: Center(
                  child: Container(
                    width: 100,
                    child: FlatButton(onPressed: () { availBobus(); },
                      child: Text('Avail',style: TextStyle(color: Colors.white),),
                      color: Colors.green,
                    ),
                  ),
                ),
                  visible: toShowAvail,
                )
              ],
            ),

          ],
        ),
      ),
    );
  }

  void availBobus() {
    AdCountController.requestThenResponsePrint(APITOKEN).then((value) {
      setState(() {
        print(value.statusCode);
        print(value.body);
        if(value.statusCode==200){
          // AdViewResponse adViewResponse = AdViewResponse.fromJson(jsonDecode(value.body));
          signInAgain();
        }
        else{
          AlertDialogueHelper().showAlertDialog(context, 'Warning',
              'You can not avail ROE today');
        }
      });
    });
  }

  void _launchURL() async {
    if (!await launch(link)) throw 'Could not launch $link';
  }

  Future<void> signInAgain() async {
    EasyLoading.show(status: 'loading...');

    SignInModel myInfo = new SignInModel(
        password: USERPASS, name: USERNAME);
    await SigninController.requestThenResponsePrint(myInfo)
        .then((value) async {
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
          MaterialPageRoute(
              builder: (context) => BottomNevigation()),
        );
      } else {
        // return LoginController.requestThenResponsePrint(jsonData);
        AlertDialogueHelper().showAlertDialog(context, 'Warning',
            'Please recheck email and password');
      }
    });
  }

}

Widget buildAdViewTile(AdViewResponsess transaction) =>
    SingleChildScrollView(
      child: Center(
        child: Text(transaction.name),
      ),
    );
