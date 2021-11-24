import 'package:flutter/cupertino.dart';
import 'package:havartye/constents/constant.dart';
import 'package:http/http.dart' as http;
class BalanceTransferController{

static Future<http.Response> requestThenResponsePrint(BuildContext context, String token,int param) async {

String domain = apiDomainRoot;

var url = '$domain/api/balance-transfer?amount=342154=$param';
var response = await http.get(Uri.parse(url),
headers: {
"Accept": "application/json",
'Authorization': 'Bearer $token',
},
);
return response;
}

}