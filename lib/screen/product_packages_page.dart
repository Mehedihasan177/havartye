import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:havartye/screen/bottomnevigation/bottomnevigation.dart';
import 'package:havartye/screen/home_page.dart';

class ProductPackage extends StatefulWidget {
  const ProductPackage({Key? key}) : super(key: key);

  @override
  _ProductPackageState createState() => _ProductPackageState();
}

class _ProductPackageState extends State<ProductPackage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                height: 60,
                // color: Color(0xFF0040A1),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => BottomNevigation()));
                        },
                        icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Product Packages",
                        style: TextStyle(fontSize: 28, color: Color(0xFF0040A1),fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(alignment: Alignment.centerLeft,child: Text("Basic", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image(
                        image: AssetImage("assets/package_image.png"),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 20,),
                      Image(
                        image: AssetImage("assets/package_image.png"),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 20,),
                      Image(
                        image: AssetImage("assets/package_image.png"),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 20,),
                      Image(
                        image: AssetImage("assets/package_image.png"),
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.5,),

              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.077,
                  width: MediaQuery.of(context).size.width * 0.95,
                  //color: Color(0xF60D72),
                  child: ElevatedButton(
                    child: Text(
                      "Purchase",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0040A1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    //color: Color(0xF60D72),
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

