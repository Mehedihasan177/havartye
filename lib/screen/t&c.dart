import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

import 'bottomnevigation/bottomnevigation.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {

  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/terms_and_condition.pdf');

    setState(() => _isLoading = false);
  }


  @override
  Widget build(BuildContext context) {
    return  WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Terms and Conditions"),
        ),
        body:Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(
            document: document,
            zoomSteps: 1,
            //uncomment below line to preload all pages
            // lazyLoad: false,
            // uncomment below line to scroll vertically
            // scrollDirection: Axis.vertical,

            //uncomment below code to replace bottom navigation with your own
            /* navigationBuilder:
                        (context, page, totalPages, jumpToPage, animateToPage) {
                      return ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.first_page),
                            onPressed: () {
                              jumpToPage()(page: 0);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              animateToPage(page: page - 2);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () {
                              animateToPage(page: page);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.last_page),
                            onPressed: () {
                              jumpToPage(page: totalPages - 1);
                            },
                          ),
                        ],
                      );
                    }, */
          ),
        ),
      ),
    );
  }
}
